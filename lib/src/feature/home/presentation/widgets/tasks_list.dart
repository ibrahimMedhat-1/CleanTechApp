import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/config/routes/app_router.dart';
import 'package:ct_clean/src/core/config/routes/navigation.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsetsDirectional.symmetric(vertical: 20.w),
        itemCount: 20,
        itemBuilder: (context, index) {
          return   TaskItem(
            onPress: () => CustomNavigator.instance.pushNamed(Routes.taskDetailsScreen),
          );
        },
      ),
    );
  }
}
