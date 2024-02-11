import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.isHeight,
          Row(
            children: [
              SizedBox(
                width: 104.w,
                height: 103.h,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(50.r)),
                  clipBehavior: Clip.antiAlias,
                  child: Icon(
                    Icons.person,
                    size: 60.sp,
                  ),
                ),
              ),
              10.isWight,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.userName.tr(context),
                    style: FontStyles.interSize18_500Black,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${AppStrings.carType.tr(context)} ",
                          style: FontStyles.interSize18_400Primary,
                        ),
                        TextSpan(
                          text: "النوع المستخدم لليوم",
                          style: FontStyles.interSize13_400Black,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          30.isHeight,
          Row(
            children: [
              Text(
                AppStrings.numberOfDailyTasks.tr(context),
                style: FontStyles.interSize20_700Primary,
              ),
              10.isWight,
              FloatingActionButton(
                onPressed: () {},
                mini: true,
                backgroundColor: AppColors.primary3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(50.r)),
                child: const Text(
                  "7",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Text(
                AppStrings.numberOfMonthlyTasks.tr(context),
                style: FontStyles.interSize20_700Primary,
              ),
              10.isWight,
              FloatingActionButton(
                onPressed: () {},
                mini: true,
                backgroundColor: AppColors.primary3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(50.r)),
                child: const Text(
                  "24",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          20.isHeight,
          SizedBox(
            height: 203.h,
            width: 381.w,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 160.w),
                      child: Column(
                        children: [
                          20.isHeight,
                          const Expanded(
                            child: AnimatedCircularProgressIndicator(
                              percentage: 30 / 100,
                            ),
                          ),
                          20.isHeight,
                          Column(
                            children: [
                              Text(
                                AppStrings.tasksCompletedForTheDay.tr(context),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${AppStrings.number.tr(context)} = 4",
                                style: FontStyles.interSize14_800Primary,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 160.w),
                      child: Column(
                        children: [
                          20.isHeight,
                          const Expanded(
                            child: AnimatedCircularProgressIndicator(
                              percentage: 74 / 100,
                            ),
                          ),
                          20.isHeight,
                          Column(
                            children: [
                              Text(
                                AppStrings.tasksCompletedForThisMonth
                                    .tr(context),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${AppStrings.number.tr(context)} = 44",
                                style: FontStyles.interSize14_800Primary,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          62.isHeight,
          ButtonWidget(
            margin: EdgeInsetsDirectional.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.15),
            borderRadius: 12.r,
            text: AppStrings.salaryDetails.tr(context),
            onPressed: () =>
                CustomNavigator.instance.pushNamed(Routes.salaryDetailsScreen),
          ),
          15.isHeight,
          ButtonWidget(
            margin: EdgeInsetsDirectional.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.15),
            borderRadius: 12.r,
            text: AppStrings.scheduleOfPreviousTasks.tr(context),
          ),
          38.isHeight,
        ],
      ),
    );
  }
}
