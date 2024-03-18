import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class DialogLogo extends StatelessWidget {
  const DialogLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 91.h,
      padding: EdgeInsetsDirectional.only(
        top: 26.h,
        bottom: 18.h,
        start: 51.w,
        end: 45.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(12.r),
          topStart: Radius.circular(12.r),
        ),
      ),
      child: Assets.images.logo.image(fit: BoxFit.cover),
    );
  }
}
