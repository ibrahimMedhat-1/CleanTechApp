import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:flutter/cupertino.dart';

class TableTasksDone extends StatelessWidget {
  const TableTasksDone({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      width: 387.w,
      child: Card(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 5.w,
            vertical: 10.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildColumn1(context),
              // 10.isWight,
              SizedBox(
                width: 50.w,
                height: 50.h,
                child: BlocBuilder<OldMissionCubit, OldMissionState>(
                  builder: (context, state) =>
                      AnimatedCircularProgressIndicator(
                    percentage: (context
                                .read<OldMissionCubit>()
                                .oldMissionModel
                                ?.percentage ??
                            0) /
                        100,
                    strokeWidth: 7.w,
                  ),
                ),
              ),
              // 10.isWight,
              buildColumn2(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildColumn1(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              AppStrings.numberOfSongsToday.tr(context),
              style: FontStyles.interSize14_800Primary,
            ),
            5.isWidth,
            Container(
              height: 25.h,
              width: 25.w,
              decoration: BoxDecoration(
                color: AppColors.primary3,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: BlocBuilder<OldMissionCubit, OldMissionState>(
                  builder: (context, state) => Text(
                    (context
                                .read<OldMissionCubit>()
                                .oldMissionModel
                                ?.totalMissions ??
                            0)
                        .toString(),
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Text(
              AppStrings.numberOfTasksCompleted.tr(context),
              style: FontStyles.interSize14_800Primary,
            ),
            5.isWidth,
            Container(
              height: 25.h,
              width: 25.w,
              decoration: BoxDecoration(
                color: AppColors.primary3,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: BlocBuilder<OldMissionCubit, OldMissionState>(
                  builder: (context, state) => Text(
                    (context
                                .read<OldMissionCubit>()
                                .oldMissionModel
                                ?.completedMissions ??
                            0)
                        .toString(),
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget buildColumn2(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 20.h,
              width: 20.w,
              color: AppColors.red,
              child: const Icon(
                CupertinoIcons.xmark,
                size: 20,
                color: AppColors.white,
              ),
            ),
            5.isWidth,
            Text(
              AppStrings.tasksNotCompleted.tr(context),
              style: TextStyle(fontSize: 12.sp),
            )
          ],
        ),
        Row(
          children: [
            Container(
              height: 20.h,
              width: 20.w,
              color: AppColors.primary,
              child: const Icon(
                Icons.check,
                size: 20,
                color: AppColors.white,
              ),
            ),
            5.isWidth,
            Text(AppStrings.tasksAlreadyCompleted.tr(context),
                style: TextStyle(fontSize: 12.sp))
          ],
        ),
      ],
    );
  }
}
