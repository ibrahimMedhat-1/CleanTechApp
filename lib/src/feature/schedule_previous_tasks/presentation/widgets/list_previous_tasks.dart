import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class ListPreviousTasks extends StatelessWidget {
  const ListPreviousTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
        itemBuilder: (context, index) {
          return SizedBox(
            height: 130.h,
            width: 376.w,
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(12.r),
                side: BorderSide(
                  color: AppColors.gray2.withOpacity(0.4),
                ),
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "تجاري",
                        style: FontStyles.interSize13_400Black
                            .copyWith(fontSize: 22.sp),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // 10.isHeight,
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
                    ],
                  ),
                  Container(
                    height: 130,
                    width: 0.5,
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                    color: AppColors.black,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.primary),
                    child: Icon(
                      Icons.check,
                      color: AppColors.white,
                      size: 60.sp,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
