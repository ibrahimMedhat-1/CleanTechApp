import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/functions/functions.dart';

class DayAndMonthDropDown extends StatelessWidget {
  const DayAndMonthDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalaryCubit, SalaryState>(
      builder: (context, state) {
        var cubit = context.read<SalaryCubit>();
        return Row(
          children: [
            Expanded(
              child: Dropdown(
                dropColor: AppColors.white,
                borderSideColor: AppColors.black,
                items: AppFunctions().generateListYearRange(),
                itemToString: (value) => value.toString(),
                itemsColor: AppColors.black,
                onTap: () {
                  print('object');
                  // cubit.listMonths?.clear();
                  // cubit.getListMonthByCurrentYear();
                },
                onChanged: cubit.yearOnChange,
                hint: AppStrings.selectYear.tr(context),
              ),
            ),
            15.isWight,
            //Month
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                child: DropdownButton(
                  value: cubit.selectedMonth,
                  items: cubit.getListMonthByCurrentYear
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.toString()),
                          ))
                      .toList(),
                  onChanged: cubit.monthOnChange,
                  hint: Text(AppStrings.selectMonth.tr(context)),
                  underline: const SizedBox.shrink(),
                  isExpanded: true,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
