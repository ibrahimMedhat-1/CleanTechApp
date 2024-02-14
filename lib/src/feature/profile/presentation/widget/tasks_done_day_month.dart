import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TasksDoneDayAndMonth extends StatelessWidget {
  const TasksDoneDayAndMonth({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = context.read<ProfileCubit>();

        return SizedBox(
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
                        Expanded(
                          child: AnimatedCircularProgressIndicator(
                            percentage:
                                (cubit.profileModel?.missionsPerToday ?? 0.0) /
                                    100,
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
                              "${AppStrings.number.tr(context)} = ${cubit.profileModel?.missionsPassedToday ?? 0.0}",
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
                        Expanded(
                          child: AnimatedCircularProgressIndicator(
                            percentage:
                                (cubit.profileModel?.missionsPerMonth ?? 0.0) /
                                    100,
                          ),
                        ),
                        20.isHeight,
                        Column(
                          children: [
                            Text(
                              AppStrings.tasksCompletedForThisMonth.tr(context),
                              overflow: TextOverflow.ellipsis,
                              style: FontStyles.interSize13_400Black,
                            ),
                            Text(
                              "${AppStrings.number.tr(context)} = ${cubit.profileModel?.missionsPassedMonth ?? 0.0}",
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
      },
    );
  }
}
