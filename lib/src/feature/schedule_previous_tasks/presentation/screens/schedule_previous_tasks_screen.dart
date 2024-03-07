import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class SchedulePreviousTaskScreen extends StatefulWidget {
  SchedulePreviousTaskScreen({super.key});

  @override
  State<SchedulePreviousTaskScreen> createState() => _SchedulePreviousTaskScreenState();
}

class _SchedulePreviousTaskScreenState extends State<SchedulePreviousTaskScreen> {
  final oldMissionCubit = sl<OldMissionCubit>();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    oldMissionCubit.getOldMission(OldMissionParams(
        year: DateTime.now().year,
        month: DateTime.now().month,
        day: DateTime.now().day));
  }
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
