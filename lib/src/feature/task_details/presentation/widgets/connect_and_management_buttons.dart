import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class ConnectAndManagementButtons extends StatefulWidget {
  const ConnectAndManagementButtons({super.key, required this.id});

  final int id;

  @override
  State<ConnectAndManagementButtons> createState() =>
      _ConnectAndManagementButtonsState();
}

class _ConnectAndManagementButtonsState
    extends State<ConnectAndManagementButtons> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  Position? bodyPosition;

  void getLocation() {
    LocationHelper.getCurrentLocation().then((value) {
      setState(() {
        bodyPosition = value;
        print(bodyPosition?.longitude);
      });
    });
  }

  Widget build(BuildContext context) {
    return BlocBuilder<TaskDetailsCubit, TaskDetailsState>(
      builder: (context, state) {
        var cubit = context.read<TaskDetailsCubit>();
        return Row(
          children: [
            Expanded(
              flex: 2,
              child: ButtonWidget(
                text: getButtonStringConfirm(context,
                    ((cubit.missionDetailsModel?.currentStatus ?? 0) - 1)),
                onPressed: () {
                  cubit.getLocation();
                  ((cubit.missionDetailsModel?.currentStatus ?? 0) - 1) < 2
                      ? showAdaptiveDialog(
                          context: context,
                          builder: (context) =>
                              ConfirmStepDialog(
                                  stepId: cubit.missionDetailsModel?.currentStatus ?? 0,
                                  missionId: widget.id),
                        )
                      : null;
                },
                color: ((cubit.missionDetailsModel?.currentStatus ?? 0) - 1) < 2
                    ? AppColors.primary
                    : AppColors.primary2,
              ),
            ),
            10.isWidth,
            // cubit.changeMissionStateModel?.status == 2
            cubit.missionDetailsModel?.currentStatus == 2
                ? Expanded(
                    child: ButtonWidget(
                      text: AppStrings.skip.tr(context),
                      onPressed: () {
                        cubit.skip(
                            missionId: widget.id,
                            lat: bodyPosition?.latitude ?? 0.0,
                            lng: bodyPosition?.longitude ?? 0.0);
                      },
                    ),
                  )
                : const SizedBox.shrink(),
            10.isWidth,
            Expanded(
              child: ButtonWidget(
                onPressed: () => showAdaptiveDialog(
                  context: context,
                  builder: (context) => ContactTheAdministrationDialog(),
                ),
                text: "${AppStrings.administration.tr(context)} 📞",
                fontStyle: TextStyle(
                  color: AppColors.white,
                  fontSize: 15.sp,
                  // fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String getButtonStringConfirm(BuildContext context, int index) => index < 0
      ? AppStrings.clientApproached.tr(context)
      : index == 0
          ? AppStrings.haveBeenReached.tr(context)
          : AppStrings.beenCompleted.tr(context);
}
