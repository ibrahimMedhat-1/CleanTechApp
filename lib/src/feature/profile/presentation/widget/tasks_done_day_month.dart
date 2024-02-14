import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TasksDoneDayAndMonth extends StatelessWidget {
  const TasksDoneDayAndMonth({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
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
                          style: FontStyles.interSize13_400Black,
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
                          style: FontStyles.interSize13_400Black,
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
    );
  }
}
