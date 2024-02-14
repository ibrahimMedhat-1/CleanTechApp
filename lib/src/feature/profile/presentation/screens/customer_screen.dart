import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class CustomerScreen extends StatefulWidget {
  CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  final profileCubit = sl<ProfileCubit>();
@override
  void initState() {
     super.initState();
     profileCubit.getProfile(UserLocal.driverId ?? 0);

  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: profileCubit,
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.isHeight,
            const ProfileWidget(),
            30.isHeight,
            NumberTaskDayAndMonth(),
            20.isHeight,
            const TasksDoneDayAndMonth(),
            30.isHeight,
            ButtonWidget(
              margin: EdgeInsetsDirectional.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.15),
              borderRadius: 12.r,
              text: AppStrings.salaryDetails.tr(context),
              onPressed: () => CustomNavigator.instance
                  .pushNamed(Routes.salaryDetailsScreen),
            ),
            15.isHeight,
            ButtonWidget(
              margin: EdgeInsetsDirectional.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.15),
              borderRadius: 12.r,
              text: AppStrings.scheduleOfPreviousTasks.tr(context),
              onPressed: () => CustomNavigator.instance
                  .pushNamed(Routes.schedulePreviousTaskScreen),
            ),
            15.isHeight,
            ButtonWidget(
              margin: EdgeInsetsDirectional.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.15),
              borderRadius: 12.r,
              text: AppStrings.signOut.tr(context),
              onPressed: () => CustomNavigator.instance.pushNamedAndRemoveUntil(
                  Routes.loginScreen, (route) => false),
            ),
            // 38.isHeight,
          ],
        ),
      ),
    );
  }
}
