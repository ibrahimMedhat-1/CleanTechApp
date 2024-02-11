import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key,this.onPress});
final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: SizedBox(
        height: 130.h,
        width: 376.w,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
             borderRadius: BorderRadiusDirectional.only(
               topEnd: Radius.circular(12.r),
               bottomEnd:Radius.circular(12.r),
             ),
            side: BorderSide(color: AppColors.gray2.withOpacity(0.4))
          ),
          child: Row(
            children: [
              Container(
                height: 130.h,
                width: 24.w,
                color: AppColors.primary,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "تجاري",
                    style:
                        FontStyles.interSize13_400Black.copyWith(fontSize: 22.sp),
                  ),
                  Assets.demo.demo1.image(height: 80.h),
                ],
              ),
              Container(
                height: 130,
                width: 0.5,
                margin: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                color: AppColors.black,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.isHeight,
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: AppStrings.placeName.tr(context),
                          style: FontStyles.interSize18_400Primary
                              .copyWith(fontSize: 16.sp),
                        ),
                        TextSpan(
                          text: "اسم المكان المقصود",
                          style: FontStyles.interSize13_400Black,
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: AppStrings.address.tr(context),
                          style: FontStyles.interSize18_400Primary
                              .copyWith(fontSize: 16.sp),
                        ),
                        TextSpan(
                          text: "عنوان المكان المقصود",
                          style: FontStyles.interSize13_400Black,
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: AppStrings.time.tr(context),
                          style: FontStyles.interSize18_400Primary
                              .copyWith(fontSize: 16.sp),
                        ),
                        TextSpan(
                          text: "عنوان المكان المقصود",
                          style: FontStyles.interSize13_400Black,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.clickToSeeDetails.tr(context),
                      textAlign: TextAlign.center,
                      style: FontStyles.interSize10_400Gray,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
