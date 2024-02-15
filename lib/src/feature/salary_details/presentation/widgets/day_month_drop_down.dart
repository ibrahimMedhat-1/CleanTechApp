import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/functions/functions.dart';

class DayAndMonthDropDown extends StatelessWidget {
  const DayAndMonthDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalaryCubit,SalaryState>(
      builder: (context, state) {
        var cubit = context.read<SalaryCubit>();
        return Row(
          children: [
            Expanded(
              child: Dropdown(
                dropColor: AppColors.white,
                borderSideColor: AppColors.black,
                items: const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
                itemToString: (value) => value.toString(),
                itemsColor: AppColors.black,
                onChanged: cubit.monthOnChange,
                hint: AppStrings.selectMonth.tr(context),
              ),
            ),
            15.isWight,
            Expanded(
              child: Dropdown(
                dropColor: AppColors.white,
                borderSideColor: AppColors.black,
                items: AppFunctions().generateListYearRange(),
                itemToString: (value) => value.toString(),
                itemsColor: AppColors.black,
                onChanged: cubit.yearOnChange,
                hint: AppStrings.selectYear.tr(context),
              ),
            ),
          ],
        );
      },
    );
  }
}
