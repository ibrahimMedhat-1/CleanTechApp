import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TaskDetailsScreen extends StatelessWidget {
  TaskDetailsScreen({super.key, required this.lat, required this.lng});

  final double lat;
  final double lng;
  final taskDetailsCubit = sl<TaskDetailsCubit>();

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        appBar: TaskDetailsAppBar(context: context),
        body: BlocProvider.value(
          value: taskDetailsCubit,
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 30.w),
            child: RefreshIndicator(
              onRefresh: () async {
                taskDetailsCubit.getMissionDetails(
                    taskDetailsCubit.missionDetailsModel?.id ?? 0);
              },
              child: ListView(
                children: [
                  24.isHeight,
                  const Row(),
                  const TaskDetailsMap(),
                  60.isHeight,
                  TaskDetailsBody(),
                ],
              ),
            ),
          ),
        ));
  }
}
