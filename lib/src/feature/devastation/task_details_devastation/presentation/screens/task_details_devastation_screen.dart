import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TaskDetailsDevastationScreen extends StatefulWidget {
  TaskDetailsDevastationScreen({super.key, required this.id
      // required this.lat,
      // required this.lng,
      });

  final int id;

  @override
  State<TaskDetailsDevastationScreen> createState() =>
      _TaskDetailsDevastationScreenState();
}

class _TaskDetailsDevastationScreenState
    extends State<TaskDetailsDevastationScreen> {
  final taskDDC = sl<TaskDetailsDevastationCubit>();

  @override
  void initState() {
    super.initState();
    taskDDC.getMissionDevastationDetails(widget.id);

    // print(taskDDC.detailsMissionModel?.latitude);
    // print(taskDDC.detailsMissionModel?.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: TaskDetailsAppBar(context: context),
      body: BlocProvider.value(
        value: taskDDC,
        child: RefreshIndicator(
          onRefresh: () async {
            taskDDC.getMissionDevastationDetails(
                taskDDC.detailsMissionModel?.id ?? 0);
          },
          child: ListView(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 30.w),
            children: [
              24.isHeight,
              const Row(),
              TaskDetailsDevastationMap(
                  // lat: lat,
                  // lng: lng,
                  ),
              50.isHeight,
              TaskDetailsDevastationBody(),
            ],
          ),
        ),
      ),
    );
  }
}
