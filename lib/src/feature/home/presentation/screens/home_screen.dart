import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/feature/home/presentation/widgets/profile_drivir_in_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 13.w),
      child: Column(
        children: [
          29.isHeight,
          const ProfileDriverInHome(),
          33.isHeight,
          SizedBox(
            height: 55.h,
            width: 398.w,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 10.h,
                  bottom: 10.h,
                  start: 20.w,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 30.h,
                      width: 30.w,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(0)),
                        color: AppColors.primary,
                      ),
                    ),
                    5.isWight,
                    Text(AppStrings.ordinaryTask.tr(context)),
                    30.isWight,
                    SizedBox(
                      height: 30.h,
                      width: 30.w,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(0)),
                        color: AppColors.red,
                      ),
                    ),
                    5.isWight,
                    Text(AppStrings.urgentTask.tr(context)),
                  ],
                ),
              ),
            ),
          ),
          const TasksList(),
          20.isHeight
        ],
      ),
    );
  }
}
