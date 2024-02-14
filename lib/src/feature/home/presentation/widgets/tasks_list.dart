import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/widgets/loading.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        var list = cubit.missionsList;
        return Expanded(
          child: list == null
              ? const LoadingWidget()
              : ListView.builder(
                  padding: EdgeInsetsDirectional.symmetric(vertical: 20.w),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    MissionModel item = list[index];
                    return TaskItem(
                      item: item,
                      onPress: () => CustomNavigator.instance
                          .pushNamed(Routes.taskDetailsScreen, arguments: item),
                    );
                  },
                ),
        );
      },
    );
  }
}
