import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:shimmer/shimmer.dart';

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
                    child: buildOneStep(
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
                  (index) => buildOneStep(
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

  Widget buildOneStep({
    required String title,
    Widget? image,
    required int index,
    int currentIndex = 0,
  }) {
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
            10.isWight,
            Text(title),
          ],
        ),
        4.isHeight,
        Container(
          height: 50.h,
          width: 2.w,
          margin: EdgeInsetsDirectional.only(start: 20.w),
          decoration: BoxDecoration(
              color: AppColors.gray1, borderRadius: BorderRadius.circular(8.r)),
        ),
        4.isHeight,
      ],
    );
  }
}
