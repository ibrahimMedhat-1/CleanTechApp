import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TotalDiscountsCard extends StatelessWidget {
  const TotalDiscountsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<SalaryCubit, SalaryState>(
        builder: (context, state) {
          var cubit = context.read<SalaryCubit>();
          return Card(
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
                      "${cubit.salaryDetailsModel?.totalDeductions ?? 0.0} ${AppStrings.sAR.tr(context)}",
                      style: FontStyles.interSize16_400White.copyWith(
                        color: AppColors.primary,
                      ),
                    )
                  ],
                ),
              ),
              children: List.generate(
                  cubit.salaryDetailsModel?.deductions?.length ?? 0, (index) {
                var item = cubit.salaryDetailsModel?.deductions?[index];
                return SizedBox(
                  height: 150.h,
                  child: Padding(
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
                          subTitle: item?.date ?? '',
                        ),
                        BaseText(
                          title: AppStrings.discountValue.tr(context),
                          subTitle: "${item?.amount ?? ''} ${AppStrings.sAR.tr(context)}",
                          textColor: AppColors.red,

                        ),
                        BaseText(
                          title: AppStrings.theReason.tr(context),
                          subTitle: item?.description ?? "",
                          textColor: AppColors.red,

                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          );
        },
      );
  }
}
