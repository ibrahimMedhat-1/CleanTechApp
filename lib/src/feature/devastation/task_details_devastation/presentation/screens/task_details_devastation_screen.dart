import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TaskDetailsDevastationScreen extends StatelessWidget {
  const TaskDetailsDevastationScreen({super.key, required this.lat, required this.lng});
  final double lat;
  final double lng;
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: TaskDetailsAppBar(context: context),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 30.w),
          children: [
            24.isHeight,
            const Row(),
            TaskDetailsDevastationMap(
              lat: lat,
              lng: lng,
            ),
            60.isHeight,


          ],
        ),
      ),
    );
  }
}
