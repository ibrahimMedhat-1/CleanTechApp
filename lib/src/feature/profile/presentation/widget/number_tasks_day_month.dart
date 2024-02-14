import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class NumberTaskDayAndMonth extends StatelessWidget {
  const NumberTaskDayAndMonth({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = context.read<ProfileCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  child: Text(
                    "${cubit.profileModel?.missionsToday ?? 0}",
                    style: const TextStyle(
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
                  child: Text(
                    "${cubit.profileModel?.missionsMonth ?? 0}",
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
