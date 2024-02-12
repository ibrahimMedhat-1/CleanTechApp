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
            children: [
              buildColumn1(context),
              10.isWight,
              SizedBox(
                width: 50.w,
                height: 50.h,
                child: AnimatedCircularProgressIndicator(
                  percentage: 70 / 100,
                  strokeWidth: 7.w,
                ),
              ),
              10.isWight,
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
            5.isWight,
            Container(
              height: 25.h,
              width: 25.w,
              decoration: BoxDecoration(
                color: AppColors.primary3,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  "24",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
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
            5.isWight,
            Container(
              height: 25.h,
              width: 25.w,
              decoration: BoxDecoration(
                color: AppColors.primary3,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  "4",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
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
            5.isWight,
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
            5.isWight,
            Text(AppStrings.tasksAlreadyCompleted.tr(context),
                style: TextStyle(fontSize: 12.sp))
          ],
        ),
      ],
    );
  }
}
