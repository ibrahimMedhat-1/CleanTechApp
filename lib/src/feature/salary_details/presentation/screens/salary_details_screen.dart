import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/widgets/drop_down.dart';

class SalaryDetailsScreen extends StatelessWidget {
  const SalaryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(
        leading: Container(
          alignment: Alignment.center,
          child: Text(
            AppStrings.taskDetails.tr(context),
            textAlign: TextAlign.center,
            style: FontStyles.interSize18_500Black
                .copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
          ),
        ),
        actions: [
          Assets.images.logoWhite.image(),
          const CustomBackButton(),
        ],
        leadingWidth: 150.w,
      ),
      body: Padding(
        padding:   EdgeInsetsDirectional.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            107.isHeight,
            Row(
              children: [
                Expanded(
                  child: Dropdown(
                    dropColor: AppColors.white,
                    borderSideColor: AppColors.black,
                    items: [],
                    itemToString: (value) => value,
                    onChanged: (value) {},
                    hint: AppStrings.selectMonth.tr(context),
                  ),
                ),
                15.isWight,
                Expanded(
                  child: Dropdown(
                    dropColor: AppColors.white,
                    borderSideColor: AppColors.black,
                    items: [],
                    itemToString: (value) => value,
                    onChanged: (value) {},
                    hint: AppStrings.selectYear.tr(context),
                  ),
                ),
              ],
            ),
            41.isHeight,
            Card(
              elevation: 5,
              child: ListTile(
                contentPadding: EdgeInsetsDirectional.symmetric(
                    vertical: 10.h, horizontal: 10.w),
                leading: Assets.images.totalSalary.image(),
                title: Row(
                  children: [
                    Text(
                      AppStrings.totalSalary.tr(context),
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
            ),
            21.isHeight,
            Card(
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
                  return Padding(
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
            ),
            21.isHeight,
            Card(
              elevation: 5,
              child: ExpansionTile(
                shape: const RoundedRectangleBorder(side: BorderSide.none),
                title: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Assets.images.minus.image(),
                  title: Row(
                    children: [
                      Text(
                        AppStrings.totalDiscounts.tr(context),
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
                  return Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(),
                        BaseText(
                          title: AppStrings.discountDate.tr(context),
                          textColor: AppColors.red,
                          subTitle: "1/7/2024",
                        ),
                        BaseText(
                          title: AppStrings.discountValue.tr(context),
                          subTitle: "200 ر.س",
                          textColor: AppColors.red,

                        ),
                        BaseText(
                          title: AppStrings.theReason.tr(context),
                          subTitle: "سبب اعطاء العمولة ",
                          textColor: AppColors.red,

                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
