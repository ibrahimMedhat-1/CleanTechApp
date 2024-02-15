import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TotalCommissionCard extends StatelessWidget {
  const TotalCommissionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalaryCubit, SalaryState>(
      builder: (context, state) {
        var cubit = context.read<SalaryCubit>();
        return Card(
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
                    "${cubit.salaryDetailsModel?.totalCommissions ?? 0.0} ${AppStrings.sAR.tr(context)}",
                    style: FontStyles.interSize16_400White.copyWith(
                      color: AppColors.primary,
                    ),
                  )
                ],
              ),
            ),
            children: List.generate(cubit.salaryDetailsModel?.commissions?.length ?? 0, (index) {
              var item = cubit.salaryDetailsModel?.commissions?[index];
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
                      subTitle: item?.date ?? '',
                    ),
                    BaseText(
                      title: AppStrings.commissionValue.tr(context),
                      subTitle: "${item?.amount ?? 0.0} ${AppStrings.sAR.tr(context)}",
                    ),
                    BaseText(
                      title: AppStrings.theReason.tr(context),
                      subTitle: item?.description ?? "",
                    ),
                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
