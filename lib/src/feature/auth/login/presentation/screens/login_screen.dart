import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
                color: AppColors.primary,
                width: double.infinity,
                child: Assets.images.backgroundLogin.image(height: 348)),
            Positioned(
              bottom: 0,
              child: Container(
                height: 600.h,
                width: MediaQuery.sizeOf(context).width,
                padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(50.r),
                      topStart: Radius.circular(50.r),
                    )),
                child: Column(
                  children: [
                    60.isHeight,
                    Assets.images.logo.image(),
                    88.isHeight,
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        AppStrings.logInToContinue.tr(context),
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary),
                      ),
                    ),
                    25.isHeight,
                      LoginForm(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
