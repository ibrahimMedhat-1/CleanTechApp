import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TaskDetailsDevastationScreen extends StatelessWidget {
  TaskDetailsDevastationScreen(
      {super.key, required this.lat, required this.lng});

  final double lat;
  final double lng;
  final taskDDC = sl<TaskDetailsDevastationCubit>();

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
                lat: lat,
                lng: lng,
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
