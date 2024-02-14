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
                color:
                    item.missionType == 0 ? AppColors.primary : AppColors.red,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.companyType == 0
                        ? AppStrings.commercial.tr(context)
                        : item.companyType == 1
                            ? AppStrings.devastation.tr(context)
                            : AppStrings.compressor.tr(context),
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
              SizedBox(
                width: 250.w,
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
                      subTitle: "${item.date ?? ""} ${AppStrings.atTime.tr(context)} ${item.time ?? ""}",
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
}
