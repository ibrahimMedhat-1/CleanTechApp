import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/feature/task_details/presentation/widgets/connect_and_management_buttons.dart';

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
    taskDetailsCubit.getLocation();
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
              : Column(
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
                    24.isHeight,
                    ConnectAndManagementButtons(id: item?.id ?? 0),
                    70.isHeight
                  ],
                );
        },
      ),
    );
  }
}
