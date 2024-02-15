import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TotalSalaryCard extends StatelessWidget {
  const TotalSalaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        contentPadding:
            EdgeInsetsDirectional.symmetric(vertical: 10.h, horizontal: 10.w),
        leading: Assets.images.totalSalary.image(),
        title: Row(
          children: [
            Text(
              AppStrings.totalSalary.tr(context),
              style: FontStyles.interSize16_400White.copyWith(
                color: AppColors.black,
              ),
            ),
            BlocBuilder<SalaryCubit, SalaryState>(
                builder: (context, state) => Text(
                      "${context.read<SalaryCubit>().salaryDetailsModel?.totalSalary ?? 0.0} ${AppStrings.sAR.tr(context)}",
                      style: FontStyles.interSize16_400White.copyWith(
                        color: AppColors.primary,
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}
