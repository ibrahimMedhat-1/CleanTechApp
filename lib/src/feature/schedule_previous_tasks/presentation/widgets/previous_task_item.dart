import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class PreviousTaskItem extends StatelessWidget {
  const PreviousTaskItem({super.key, required this.item});

  final Missions item;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OldMissionCubit, OldMissionState>(
      builder: (context, state) {
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
                5.isWight,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      getTypeName(context),
                      style: FontStyles.interSize13_400Black
                          .copyWith(fontSize: 21.sp),
                    ),
                    getTypeImage(),
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
                     Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: AppStrings.placeName.tr(context),
                            style: FontStyles.interSize18_400Primary
                                .copyWith(fontSize: 16.sp),
                          ),
                          TextSpan(
                            text: item.company ?? "",
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
                            text: item.address ?? "",
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
                            text:
                                "${item.date ?? ""} ${AppStrings.atTime.tr(context)} ${item.time ?? ""}",
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
                  // height: 50,
                  // width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: item.status == 0 ? AppColors.primary : AppColors.red,
                  ),
                  child: item.status == 0
                      ? Icon(
                          Icons.check,
                          color: AppColors.white,
                          size: 50.sp,
                        )
                      : Icon(
                          Icons.close,
                          color: AppColors.white,
                          size: 50.sp,
                        ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  String getTypeName(BuildContext context) => item.companyType == 0
      ? AppStrings.commercial.tr(context)
      : item.companyType == 1
          ? AppStrings.devastation.tr(context)
          : AppStrings.compressor.tr(context);

  Widget getTypeImage() => item.companyType == 0
      ? Assets.demo.demo1.image(height: 80.h)
      : item.companyType == 1
          ? Assets.demo.demo2.image(height: 80.h)
          : Assets.demo.demo3.image(height: 80.h);
}
