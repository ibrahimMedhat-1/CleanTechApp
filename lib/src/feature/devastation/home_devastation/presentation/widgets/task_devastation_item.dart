import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TaskDevastationItem extends StatelessWidget {
  const TaskDevastationItem({super.key, this.onPress, required this.item});

  final VoidCallback? onPress;
  final MissionDevastationModel item;

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
                color:
                    item.missionType == 0 ? AppColors.primary : AppColors.red,
              ),
              3.isWight,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.devastation.tr(context),
                    textAlign: TextAlign.start,
                    style: FontStyles.interSize13_400Black
                        .copyWith(fontSize: 21.sp),
                  ),
                  // Assets.demo.demo2.image(height: 80.h),
                  devastationImage
                  // getTypeImage() ?? const SizedBox.shrink(),
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
                    BaseText(
                        title: AppStrings.placeName.tr(context),
                        subTitle: item.company ?? ""),
                    BaseText(
                        title: AppStrings.address.tr(context),
                        subTitle: item.address ?? ""),
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

  Widget get devastationImage => item.missionType == 0
      ? Assets.images.shab.image()
      : item.missionType == 1
      ? Assets.images.tanzel.image()
      : item.missionType == 2
      ? Assets.images.tabdel.image()
      : Assets.images.tahdel.image();

}
