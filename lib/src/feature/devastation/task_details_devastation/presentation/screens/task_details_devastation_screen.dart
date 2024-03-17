import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/customs/task_details_appbar.dart';

class TaskDetailsDevastationScreen extends StatelessWidget {
  const TaskDetailsDevastationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: TaskDetailsAppBar(context: context),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
