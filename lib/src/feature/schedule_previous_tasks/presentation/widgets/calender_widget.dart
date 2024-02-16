import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.black,
          ),
          borderRadius: BorderRadius.circular(8.r)),
      height: 286.h,
      width: 387.w,
      child: BlocBuilder<OldMissionCubit, OldMissionState>(
        builder: (context, state) => CalendarDatePicker(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now(),
          onDateChanged: context.read<OldMissionCubit>().calenderOnDateChanged
        ),
      ),
    );
  }
}
