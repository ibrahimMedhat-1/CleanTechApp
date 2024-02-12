import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class ContactTheAdministrationDialog extends StatelessWidget {
  const ContactTheAdministrationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 320.w,
          height: 238.h,
          decoration: BoxDecoration(
          color: AppColors.primary2,
            borderRadius: BorderRadiusDirectional.circular(8.r)
          ),
          child: Column(
            children: [
              Container(
                height: 91.h,
                width: double.infinity,
                padding: EdgeInsetsDirectional.only(
                  top: 26.h,
                  bottom: 18.h,
                  start: 51.w,
                  end: 45.w,
                ),
                decoration: BoxDecoration(
                color: AppColors.white,
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(8.r),
                    topEnd: Radius.circular(8.r)
                  )
                ),
                child: Assets.images.logo.image(
                  width: double.infinity,
                  height: 91.h,
                  fit: BoxFit.cover
                ),
              ),
              19.isHeight,
              Text(
                AppStrings.contactTheAdministrationThrough.tr(context),
                style: FontStyles.interSize16_400White.copyWith(
                  color: AppColors.black,
                ),
              ),
              26.isHeight,
              Row(
                children: [
                  10.isWight,
                  Expanded(
                    child: ButtonWidget(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.svgs.whatsappIcon
                              .svg(width: 30.w, height: 30.h),
                          10.isWight,
                          Text(
                            AppStrings.whatsApp.tr(context),
                            style: FontStyles.interSize16_400White,
                          )
                        ],
                      ),
                    ),
                  ),
                  10.isWight,
                  Expanded(
                    child: ButtonWidget(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.svgs.callIcon.svg(height: 30.h, width: 30.w),
                          10.isWight,
                          Text(
                            AppStrings.connection.tr(context),
                            style: FontStyles.interSize16_400White,
                          )
                        ],
                      ),
                    ),
                  ),
                  10.isWight,
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
