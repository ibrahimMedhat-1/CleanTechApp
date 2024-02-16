import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/feature/schedule_previous_tasks/presentation/manager/old_mission_cubit.dart';

class SchedulePreviousTaskScreen extends StatelessWidget {
  SchedulePreviousTaskScreen({super.key});

  final oldMissionCubit = sl<OldMissionCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: oldMissionCubit,
      child: MyScaffold(
        appBar: AppBar(
          leading: Container(
            alignment: Alignment.center,
            child: Text(
              AppStrings.schedulePreviousTasks.tr(context),
              textAlign: TextAlign.center,
              style: FontStyles.interSize18_500Black.copyWith(
                  color: AppColors.white, fontWeight: FontWeight.w700),
            ),
          ),
          actions: [
            Assets.svgs.logoWhite.svg(width: 120.w),
            const CustomBackButton(),
          ],
          leadingWidth: 190.w,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(),
            41.isHeight,
            const CalenderWidget(),
            18.isHeight,
            const TableTasksDone(),
            20.isHeight,
            const ListPreviousTasks(),
          ],
        ),
      ),
    );
  }
}
