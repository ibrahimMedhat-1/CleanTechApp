import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class PreviousTaskItem extends StatelessWidget {
  const PreviousTaskItem({super.key, required this.item});

  final Missions item;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OldMissionCubit, OldMissionState>(
      builder: (context, state) {
        return SizedBox(
          // height: 130.h,
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
                5.isWidth,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      UserLocal.type == 1 ? getTypeName(context) : titleDevastation(context),
                      style: FontStyles.interSize13_400Black.copyWith(fontSize: 21.sp),
                    ),
                    UserLocal.type == 1 ? getTypeImage() : devastationImage,
                  ],
                ),
                Container(
                  height: 130,
                  width: 0.5,
                  margin: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                  color: AppColors.black,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 0.45,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: AppStrings.placeName.tr(context),
                              style: FontStyles.interSize18_400Primary.copyWith(fontSize: 16.sp),
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
                              style: FontStyles.interSize18_400Primary.copyWith(fontSize: 16.sp),
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
                              style: FontStyles.interSize18_400Primary.copyWith(fontSize: 16.sp),
                            ),
                            TextSpan(
                              text: "${item.date ?? ""} ${AppStrings.atTime.tr(context)} ${item.time ?? ""}",
                              style: FontStyles.interSize13_400Black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                    color: UserLocal.type == 1
                        ? (item.status == 3 ? AppColors.primary : AppColors.red)
                        : (item.status == 2 ? AppColors.primary : AppColors.red),
                  ),
                  child: UserLocal.type == 1
                      ? (item.status == 3
                          ? Icon(
                              Icons.check,
                              color: AppColors.white,
                              size: 50.sp,
                            )
                          : Icon(
                              Icons.close,
                              color: AppColors.white,
                              size: 50.sp,
                            ))
                      : (item.status == 2
                          ? Icon(
                              Icons.check,
                              color: AppColors.white,
                              size: 50.sp,
                            )
                          : Icon(
                              Icons.close,
                              color: AppColors.white,
                              size: 50.sp,
                            )),
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

  // UserLocal.type == 1 ? old : devastation

  Widget get devastationImage => item.companyType == 0
      ? Assets.images.shab.image()
      : item.companyType == 1
          ? Assets.images.tanzel.image()
          : item.companyType == 2
              ? Assets.images.tabdel.image()
              : Assets.images.tahdel.image();

  String titleDevastation(BuildContext context) => item.companyType == 0
      ? AppStrings.lifting.tr(context)
      : item.companyType == 1
          ? AppStrings.placeContainer.tr(context)
          : item.companyType == 2
              ? AppStrings.switchMission.tr(context)
              : AppStrings.modificationWithoutTam.tr(context);
}
