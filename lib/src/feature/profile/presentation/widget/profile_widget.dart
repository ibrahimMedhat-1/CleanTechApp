import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:restart_app/restart_app.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = context.read<ProfileCubit>();
        return Row(
          children: [
            SizedBox(
              width: 104.w,
              height: 103.h,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(50.r)),
                clipBehavior: Clip.antiAlias,
                child: cubit.profileModel == null
                    ? Icon(
                        Icons.person,
                        size: 60.sp,
                      )
                    : cubit.profileModel?.image == null
                        ? Icon(
                            Icons.person,
                            size: 60.sp,
                          )
                        : Image.network(
                            cubit.profileModel?.image == null || cubit.profileModel?.image == ''
                                ? 'http://via.placeholder.com/150x150'
                                : cubit.profileModel?.image ?? 'http://via.placeholder.com/150x150',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Assets.svgs.person.svg();
                            },
                          ),
              ),
            ),
            10.isWight,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.5),
                  child: Text(
                    cubit.profileModel?.name ?? ''.loadingString,
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "${AppStrings.carType.tr(context)} ",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: cubit.profileModel?.car ?? '███▒▒▒ 70…',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            IconButton(
              onPressed: () {
                CacheHelper.removeData(key: MyCashKey.driverId);
                CacheHelper.removeData(key: MyCashKey.driverName);
                CustomNavigator.instance.pushNamedAndRemoveUntil(Routes.loginScreen, (route) => false);
                Restart.restartApp();
              },
              icon:
                  // Icon(Icons.logout),
                  RotatedBox(quarterTurns: UserLocal.lang == "en" ? 2 : 0, child: Assets.svgs.logout.svg()),
            ),
          ],
        );
      },
    );
  }
}
