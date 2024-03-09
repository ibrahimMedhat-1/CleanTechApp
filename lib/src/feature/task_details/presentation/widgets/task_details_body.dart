import 'package:ct_clean/src/core/config/routes/app_imports.dart';

import '../../../../core/widgets/loading.dart';

class TaskDetailsBody extends StatefulWidget {
  TaskDetailsBody({super.key});

  @override
  State<TaskDetailsBody> createState() => _TaskDetailsBodyState();
}

class _TaskDetailsBodyState extends State<TaskDetailsBody> {
  final homeCubit = sl<HomeCubit>();
  final taskDetailsCubit = sl<TaskDetailsCubit>();

  @override
  void initState() {
    super.initState();
    // taskDetailsCubit.getMissionDetails(widget.item.id ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: taskDetailsCubit,
      child: BlocConsumer<TaskDetailsCubit, TaskDetailsState>(
        listener: (context, state) {
          if (state is ChangeMissionStateSuccess) {
            print(
                "***************************** ChangeMissionStateSuccess ${state.changeMissionStateModel?.next} ****************************");
            if ((state.changeMissionStateModel?.next ?? 0) != 0) {
              print("*****************************************************");
              taskDetailsCubit
                  .getMissionDetails(state.changeMissionStateModel?.next ?? 0);
            } else {
              taskDetailsCubit.getMissionDetails(
                  taskDetailsCubit.missionDetailsModel?.id ?? 0);
            }
            if (state.changeMissionStateModel?.next == null) {
              CustomNavigator.instance.pop();
            }
          }
        },
        builder: (context, state) {
          var taskDetailsCubit = context.read<TaskDetailsCubit>();
          var item = taskDetailsCubit.missionDetailsModel;
          var next = taskDetailsCubit.changeMissionStateModel?.next;
          return next != 0 && state is ChangeMissionStateLoading
              ? const LoadingWidget()
              : Padding(
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
                                  subTitle: item?.company ?? 'Loading...',
                                ),
                                // Assets.images.placeLogo.image()
                              ],
                            ),
                            19.isHeight,
                            BaseText(
                              title: AppStrings.placeAddress.tr(context),
                              subTitle: item?.address ?? 'Loading...',
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
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.45,
                            ),
                            child: Text(
                              (item?.description ?? 'Loading...'),
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
                      StepsWidget(missionId: item?.id ?? 0),
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
                            child: ButtonWidget(
                              text: getButtonStringConfirm(
                                  context,
                                  ((taskDetailsCubit.missionDetailsModel
                                              ?.currentStatus ??
                                          0) -
                                      1)),
                              onPressed: () {
                                taskDetailsCubit.getLocation();
                                ((taskDetailsCubit.missionDetailsModel
                                                    ?.currentStatus ??
                                                0) -
                                            1) <
                                        2
                                    ? showAdaptiveDialog(
                                        context: context,
                                        builder: (context) => ConfirmStepDialog(
                                          missionId: item?.id ?? 0,
                                        ),
                                      )
                                    : null;
                              },
                              color: ((taskDetailsCubit.missionDetailsModel
                                                  ?.currentStatus ??
                                              0) -
                                          1) <
                                      2
                                  ? AppColors.primary
                                  : AppColors.primary2,
                            ),
                          ),
                          24.isWight,
                          Expanded(
                            child: ButtonWidget(
                              onPressed: () => showAdaptiveDialog(
                                context: context,
                                builder: (context) =>
                                    ContactTheAdministrationDialog(),
                              ),
                              text:
                                  "${AppStrings.administration.tr(context)} 📞",
                            ),
                          ),
                        ],
                      ),
                      70.isHeight
                    ],
                  ),
                );
        },
      ),
    );
  }

  String getButtonStringConfirm(BuildContext context, int index) => index < 0
      ? AppStrings.clientApproached.tr(context)
      : index == 0
          ? AppStrings.haveBeenReached.tr(context)
          : AppStrings.beenCompleted.tr(context);
}
