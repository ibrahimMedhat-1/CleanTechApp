import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class StepsWidget extends StatelessWidget {
  const StepsWidget({super.key, required this.missionId});

  final int missionId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskDetailsCubit, TaskDetailsState>(
      listener: (context, state) {
        //
        if (state is ChangeMissionStateSuccess &&
            state.changeMissionStateModel?.next == 0) {
          context.read<TaskDetailsCubit>().getMissionDetails(
              context.read<TaskDetailsCubit>().missionDetailsModel?.id ?? 0);
        }
      },
      builder: (context, state) {
        return state is ChangeMissionStateLoading
            ? Column(
                children: List.generate(
                  StepsDataModel.listSteps(context).length,
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
                  StepsDataModel.listSteps(context).length,
                  (index) => BuildOneStepClass(
                    title: StepsDataModel.listSteps(context)[index].title,
                    index: index,
                    image: StepsDataModel.listSteps(context)[index].image,
                    currentIndex: (context
                                .read<TaskDetailsCubit>()
                                .missionDetailsModel
                                ?.currentStatus ??
                            0) -
                        1,
                  ),
                ),
              );
      },
    );
  }
}

class BuildOneStepClass extends StatelessWidget {
  const BuildOneStepClass(
      {super.key,
      required this.title,
      required this.index,
      this.image,
      this.currentIndex = 0,
      this.showTile = true});

  final String title;
  final Widget? image;
  final int index;
  final int currentIndex;
  final bool showTile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.gray1)),
              child: currentIndex >= index ? image : null,
            ),
            10.isWidth,
            Text(title),
          ],
        ),
        4.isHeight,
        showTile
            ? Container(
                height: 50.h,
                width: 2.w,
                margin: EdgeInsetsDirectional.only(start: 20.w),
                decoration: BoxDecoration(
                    color: AppColors.gray1,
                    borderRadius: BorderRadius.circular(8.r)),
              )
            : const SizedBox.shrink(),
        4.isHeight,
      ],
    );
  }
}
