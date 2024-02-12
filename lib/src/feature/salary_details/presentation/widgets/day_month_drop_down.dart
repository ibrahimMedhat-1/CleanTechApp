import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class DayAndMonthDropDown extends StatelessWidget {
  const DayAndMonthDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
