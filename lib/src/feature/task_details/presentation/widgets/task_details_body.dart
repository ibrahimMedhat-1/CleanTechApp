import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TaskDetailsBody extends StatefulWidget {
  TaskDetailsBody({super.key, required this.item});

  final MissionModel item;

  @override
  State<TaskDetailsBody> createState() => _TaskDetailsBodyState();
}

class _TaskDetailsBodyState extends State<TaskDetailsBody> {
  final taskDetailsCubit = sl<TaskDetailsCubit>();

  final homeCubit = sl<HomeCubit>();
@override
  void initState() {
     super.initState();
    taskDetailsCubit.getMissionDetails(widget.item.id ?? 0);
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: taskDetailsCubit,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      BaseText(
                        title: AppStrings.placeName.tr(context),
                        subTitle: widget.item.company ?? '',
                      ),
                      // Assets.images.placeLogo.image()
                    ],
                  ),
                  19.isHeight,
                  BaseText(
                    title: AppStrings.placeAddress.tr(context),
                    subTitle: widget.item.address ?? '',
                  ),

                  // BaseText(
                  //     title: "${AppStrings.taskDetails.tr(context)} :mmnn ",
                  //     subTitle:
                  // ),
                ],
              ),
            ),
            19.isHeight,
            Row(
              children: [
                Text(
                  "${AppStrings.taskDetails.tr(context)} : ",
                  style: FontStyles.interSize18_400Primary.copyWith(
                    fontSize: 18.sp,
                    color: AppColors.primary,
                    // overflow: TextOverflow.clip,
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.45,
                  ),
                  child: Text(
                    (widget.item.description ?? ''),
                    maxLines: 3,
                    style: FontStyles.interSize13_400Black.copyWith(
                      fontSize: 16.sp,

                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            19.isHeight,
            StepsWidget(missionId: widget.item.id ?? 0),
            // BlocProvider.value(
            //   value: homeCubit,
            //   child: BlocBuilder<HomeCubit, HomeState>(
            //     bloc: homeCubit,
            //     builder: (context, state) {
            //       return BlocConsumer(
            //         bloc: taskDetailsCubit,
            //         listener: (context, state) {
            //           if (state is ChangeMissionStateSuccess) {
            //             homeCubit.getMissionsList();
            //           }
            //         },
            //         builder: (context, state) {
            //           return StepsWidget(currentIndex: item.currentStatus ?? 0
            //               // taskDetailsCubit.currentStepIndex,
            //               );
            //         },
            //       );
            //     },
            //   ),
            // ),
            24.isHeight,
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: BlocBuilder(
                    bloc: taskDetailsCubit,
                    builder: (context, state) => ButtonWidget(
                      text: getButtonStringConfirm(
                          context,
                          ((taskDetailsCubit
                                  .missionDetailsModel?.currentStatus ??
                              0)-1)),
                      onPressed: () => ((taskDetailsCubit
                          .missionDetailsModel?.currentStatus ?? 0) -1) < 2
                          ? showAdaptiveDialog(
                              context: context,
                              builder: (context) => ConfirmStepDialog(
                                missionId: widget.item.id ?? 0,
                              ),
                            )
                          : null,
                      color: ((taskDetailsCubit
                          .missionDetailsModel?.currentStatus ?? 0) -1) < 2
                          ? AppColors.primary
                          : AppColors.primary2,
                    ),
                  ),
                ),
                24.isWight,
                Expanded(
                  child: ButtonWidget(
                    onPressed: () => showAdaptiveDialog(
                      context: context,
                      builder: (context) => ContactTheAdministrationDialog(),
                    ),
                    text: "${AppStrings.administration.tr(context)} 📞",
                  ),
                ),
              ],
            ),
            70.isHeight
          ],
        ),
      ),
    );
  }

  String getButtonStringConfirm(BuildContext context, int index) => index < 0
      ? AppStrings.clientApproached.tr(context)
      : index == 0
          ? AppStrings.haveBeenReached.tr(context)
          : AppStrings.beenCompleted.tr(context);
}
