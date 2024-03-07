import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/widgets/loading.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeCubit>().getMissionsList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        var list = cubit.missionsList;
        return Expanded(
          child: list == null
              ? const LoadingWidget()
              : RefreshIndicator(
                  onRefresh: () async {
                    cubit.getMissionsList();
                  },
                  child: ListView.builder(
                    padding: EdgeInsetsDirectional.symmetric(vertical: 20.w),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      MissionModel item = list[index];
                      return TaskItem(
                          item: item,
                          onPress: () {
                            CustomNavigator.instance
                                .pushNamed(Routes.taskDetailsScreen,
                                    arguments: item)
                                .then((value) {
                              cubit.getMissionsList();
                            });
                            CacheHelper.saveData(
                                key: MyCashKey.missionId, value: item.id ?? 0);
                          });
                    },
                  ),
                ),
        );
      },
    );
  }
}
