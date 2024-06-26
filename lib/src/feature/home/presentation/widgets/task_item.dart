import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, this.onPress, required this.item});

  final VoidCallback? onPress;
  final MissionModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: SizedBox(
        height: 150.h,
        width: 376.w,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(12.r),
                bottomEnd: Radius.circular(12.r),
              ),
              side: BorderSide(color: AppColors.gray2.withOpacity(0.4))),
          child: Row(
            children: [
              Container(
                height: double.infinity,
                width: 24.w,
                color: item.missionType == 0 ? AppColors.primary : AppColors.red,
              ),
              3.isWidth,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    getTypeName(context),
                    textAlign: TextAlign.start,
                    style: FontStyles.interSize13_400Black.copyWith(fontSize: 21.sp),
                  ),
                  getTypeImage() ?? const SizedBox.shrink(),
                ],
              ),
              Container(
                height: 130,
                width: 0.5,
                margin: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                color: AppColors.black,
              ),
              SizedBox(
                width: 220.w,
                height: 150.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.isHeight,
                    BaseText(title: AppStrings.placeName.tr(context), subTitle: item.company ?? ""),
                    BaseText(title: AppStrings.address.tr(context), subTitle: item.address ?? ""),
                    BaseText(
                      title: AppStrings.time.tr(context),
                      subTitle: "${item.time ?? ""} - ${item.date ?? ""}",
                      subTitleFontSize: 14.sp,
                    ),
                    10.isHeight,
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppStrings.clickToSeeDetails.tr(context),
                          textAlign: TextAlign.center,
                          style: FontStyles.interSize10_400Gray,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getTypeName(BuildContext context) => item.companyType == 0
      ? AppStrings.commercial.tr(context)
      : item.companyType == 1
          ? AppStrings.devastation.tr(context)
          : item.companyType == 2
              ? AppStrings.compressor.tr(context)
              : AppStrings.other.tr(context);

  Widget? getTypeImage() => item.companyType == 0
      ? Assets.demo.demo1.image(height: 80.h)
      : item.companyType == 1
          ? Assets.demo.demo2.image(height: 80.h)
          : item.companyType == 2
              ? Assets.demo.demo3.image(height: 80.h)
              : Assets.demo.otherCion.image(height: 80.h);
}
