import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TaskDetailsBody extends StatelessWidget {
  TaskDetailsBody({super.key, required this.item});

  final taskDetailsCubit = sl<TaskDetailsCubit>();
  final MissionModel item;

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
                        subTitle: item.company ?? '',
                      ),
                      // Assets.images.placeLogo.image()
                    ],
                  ),
                  19.isHeight,
                  BaseText(
                    title: AppStrings.placeAddress.tr(context),
                    subTitle: item.address ?? '',
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
                    (item.description ?? ''),
                    maxLines: 3,
                    style: FontStyles.interSize13_400Black.copyWith(
                        fontSize: 16.sp,

                        // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
            19.isHeight,
            BlocBuilder(
              bloc: taskDetailsCubit,
              builder: (context, state) {
                return StepsWidget(
                  currentIndex: taskDetailsCubit.currentStepIndex,
                );
              },
            ),
            24.isHeight,
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: BlocBuilder(
                    bloc: taskDetailsCubit,
                    builder: (context, state) => ButtonWidget(
                      text: getButtonStringConfirm(context),
                       onPressed: () =>taskDetailsCubit.currentStepIndex < 3 ?
                        showAdaptiveDialog(
                          context: context,
                          builder: (context) => ConfirmStepDialog(
                            missionId: item.id ?? 0,
                          ),
                        ) : null,
                      color: taskDetailsCubit.currentStepIndex < 3 ? AppColors.primary : AppColors.primary2,
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

  String getButtonStringConfirm(BuildContext context) =>
      taskDetailsCubit.currentStepIndex < 0
          ? AppStrings.clientApproached.tr(context)
          : taskDetailsCubit.currentStepIndex == 0
              ? AppStrings.haveBeenReached.tr(context)
              : taskDetailsCubit.currentStepIndex == 1
                  ? AppStrings.beginningOfDischarge.tr(context)
                  : AppStrings.beenCompleted.tr(context);
}
