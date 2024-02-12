import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class SalaryDetailsScreen extends StatelessWidget {
  const SalaryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(
        leading: Container(
          alignment: Alignment.center,
          child: Text(
            AppStrings.salaryDetails.tr(context),
            textAlign: TextAlign.center,
            style: FontStyles.interSize18_500Black
                .copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
          ),
        ),
        actions: [
          Assets.svgs.logoWhite.svg(width: 120.w),
          const CustomBackButton(),
        ],
        leadingWidth: 150.w,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              107.isHeight,
              const DayAndMonthDropDown(),
              41.isHeight,
              TotalSalaryCard(),
              21.isHeight,
              TotalCommissionCard(),
              21.isHeight,
              TotalDiscountsCard(),
              50.isHeight
            ],
          ),
        ),
      ),
    );
  }
}
