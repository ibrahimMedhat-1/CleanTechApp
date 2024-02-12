import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:flutter/cupertino.dart';

class SchedulePreviousTaskScreen extends StatelessWidget {
  const SchedulePreviousTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        appBar: AppBar(
          leading: Container(
            alignment: Alignment.center,
            child: Text(
              AppStrings.schedulePreviousTasks.tr(context),
              textAlign: TextAlign.center,
              style: FontStyles.interSize18_500Black.copyWith(
                  color: AppColors.white, fontWeight: FontWeight.w700),
            ),
          ),
          actions: [
            Assets.svgs.logoWhite.svg(width: 120.w),
            const CustomBackButton(),
          ],
          leadingWidth: 190.w,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(),
            41.isHeight,
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.black,
                  ),
                  borderRadius: BorderRadius.circular(8.r)),
              height: 286.h,
              width: 387.w,
              child: CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(Duration(days: 365)),
                lastDate: DateTime.now().add(Duration(days: 365)),
                onDateChanged: (value) {},
              ),
            ),
            18.isHeight,
            SizedBox(
              height: 120.h,
              width: 387.w,
              child: Card(
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 5.w,
                    vertical: 10.h,
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
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
                      ),
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
                      Column(
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
                              Text(AppStrings.tasksNotCompleted.tr(context),style: TextStyle(fontSize: 12.sp),)
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
                              Text(AppStrings.tasksAlreadyCompleted.tr(context),style: TextStyle(fontSize: 12.sp))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            20.isHeight,
            Expanded(
                child: ListView.builder(
              itemCount: 10,
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 130.h,
                  width: 376.w,
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(12.r),
                      side: BorderSide(
                        color: AppColors.gray2.withOpacity(0.4),
                      ),
                    ),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "تجاري",
                              style: FontStyles.interSize13_400Black
                                  .copyWith(fontSize: 22.sp),
                            ),
                            Assets.demo.demo1.image(height: 80.h),
                          ],
                        ),
                        Container(
                          height: 130,
                          width: 0.5,
                          margin:
                              EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                          color: AppColors.black,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.isHeight,
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: AppStrings.placeName.tr(context),
                                    style: FontStyles.interSize18_400Primary
                                        .copyWith(fontSize: 16.sp),
                                  ),
                                  TextSpan(
                                    text: "اسم المكان المقصود",
                                    style: FontStyles.interSize13_400Black,
                                  ),
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: AppStrings.address.tr(context),
                                    style: FontStyles.interSize18_400Primary
                                        .copyWith(fontSize: 16.sp),
                                  ),
                                  TextSpan(
                                    text: "عنوان المكان المقصود",
                                    style: FontStyles.interSize13_400Black,
                                  ),
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: AppStrings.time.tr(context),
                                    style: FontStyles.interSize18_400Primary
                                        .copyWith(fontSize: 16.sp),
                                  ),
                                  TextSpan(
                                    text: "عنوان المكان المقصود",
                                    style: FontStyles.interSize13_400Black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 130,
                          width: 0.5,
                          margin:
                              EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                          color: AppColors.black,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.primary),
                          child: Icon(
                            Icons.check,
                            color: AppColors.white,
                            size: 60.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ))
          ],
        ));
  }
}
