import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TotalCommissionCard extends StatelessWidget {
  const TotalCommissionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 5,
      child: ExpansionTile(
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Assets.images.totalCommissions.image(),
          title: Row(
            children: [
              Text(
                AppStrings.totalCommissions.tr(context),
                style: FontStyles.interSize16_400White.copyWith(
                  color: AppColors.black,
                ),
              ),
              Text(
                "200 ر.س",
                style: FontStyles.interSize16_400White.copyWith(
                  color: AppColors.primary,
                ),
              )
            ],
          ),
        ),
        children: List.generate(3, (index) {
          return Container(
            height: 150.h,
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 20.w,
              vertical: 10.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(),
                BaseText(
                  title: AppStrings.commissionDate.tr(context),
                  subTitle: "1/7/2024",
                ),
                BaseText(
                  title: AppStrings.commissionValue.tr(context),
                  subTitle: "200 ر.س",
                ),
                BaseText(
                  title: AppStrings.theReason.tr(context),
                  subTitle: "سبب اعطاء العمولة ",
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
