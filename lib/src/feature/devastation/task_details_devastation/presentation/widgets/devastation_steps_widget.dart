import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class DevastationStepsWidget extends StatefulWidget {
  const DevastationStepsWidget(
      {super.key, required this.missionId, required this.missionType});

  final int missionId;
  final int missionType;

  @override
  State<DevastationStepsWidget> createState() => _DevastationStepsWidgetState();
}

class _DevastationStepsWidgetState extends State<DevastationStepsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskDetailsDevastationCubit,
        TaskDetailsDevastationState>(
      listener: (context, state) {
        if (state is ChangeDevastationStateSuccess && state.r.next == 0) {
          context
              .read<TaskDetailsDevastationCubit>()
              .getMissionDevastationDetails(context
                      .read<TaskDetailsDevastationCubit>()
                      .detailsMissionModel
                      ?.id ??
                  0);
        }
      },
      builder: (context, state) {
        var cubit = context.read<TaskDetailsDevastationCubit>();
        return state is ChangeDevastationStateLoading
            ? Column(
                children: List.generate(
                  StepsDevastationDataModel.listSteps(context).length,
                  (index) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: BuildOneStepClass(
                      index: index,
                      title: 'Loading',
                      image: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.gray1)),
                      ),
                    ),
                  ),
                ),
              )
            : Column(
                children: List.generate(
                  StepsDevastationDataModel.listSteps(context).length,
                  (index) => BuildOneStepClass(
                    title: index == 0
                        ? StepsDevastationDataModel.listSteps(context)[index]
                            .title
                        : getSecondMissionTitle,
                    index: index,
                    image: StepsDevastationDataModel.listSteps(context)[index]
                        .image,
                    currentIndex:
                        ((cubit.detailsMissionModel?.currentStatus ?? 0) - 1),
                    showTile: index != 0 ? false : true,
                  ),
                ),
              );
      },
    );
  }

  String get getSecondMissionTitle => widget.missionType == 0
      ? AppStrings.pull.tr(context)
      : widget.missionType == 1
          ? AppStrings.rebate.tr(context)
          : widget.missionType == 2
              ? AppStrings.switchState.tr(context)
              : AppStrings.modification.tr(context);
}
