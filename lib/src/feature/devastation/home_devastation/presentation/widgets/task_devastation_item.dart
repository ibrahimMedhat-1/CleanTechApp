import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TaskDevastationItem extends StatefulWidget {
  const TaskDevastationItem({super.key, this.onPress, required this.item});

  final VoidCallback? onPress;
  final MissionDevastationModel item;

  @override
  State<TaskDevastationItem> createState() => _TaskDevastationItemState();
}

class _TaskDevastationItemState extends State<TaskDevastationItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
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
                    widget.item.companyType == 0 ? AppColors.primary : AppColors.red,
              ),
              3.isWidth,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
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
                        subTitle: widget.item.company ?? ""),
                    BaseText(
                        title: AppStrings.address.tr(context),
                        subTitle: widget.item.address ?? ""),
                    BaseText(
                      title: AppStrings.time.tr(context),
                      subTitle: "${widget.item.time ?? ""} - ${widget.item.date ?? ""}",
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

  Widget get devastationImage => widget.item.missionType == 0
      ? Assets.images.shab.image()
      : widget.item.missionType == 1
      ? Assets.images.tanzel.image()
      : widget.item.missionType == 2
      ? Assets.images.tabdel.image()
      : Assets.images.tahdel.image();

  String get title =>
      widget.item.missionType == 0
          ? AppStrings.lifting.tr(context)
          : widget.item.missionType == 1
          ? AppStrings.placeContainer.tr(context)
          : widget.item.missionType == 2
          ? AppStrings.switchMission.tr(context)
          : AppStrings.modificationWithoutTam.tr(context);
}
