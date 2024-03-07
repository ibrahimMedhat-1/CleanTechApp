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
    super.initState();
    context.read<HomeCubit>().getMissionsList();
  }

  final taskDetailsCubit = sl<TaskDetailsCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: taskDetailsCubit,
      child: BlocListener(
        bloc: taskDetailsCubit,
        listener: (context, state) {
          // if (state is GetMissionDetailsSuccess) {
          //   CustomNavigator.instance
          //       .pushNamed(Routes.taskDetailsScreen)
          //       .then((value) {
          //     context.read<HomeCubit>().getMissionsList();
          //   });
          // }
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = context.read<HomeCubit>();
            var list = cubit.missionsList;
            return Expanded(
              child: list == null
                  ? const LoadingWidget()
                  : RefreshIndicator(
                      onRefresh: () async => cubit.getMissionsList(),
                      child: ListView.builder(
                        padding:
                            EdgeInsetsDirectional.symmetric(vertical: 20.w),
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          MissionModel item = list[index];
                          return TaskItem(
                              item: item,
                              onPress: () {
                                item.id == null || item.id == 0
                                    ? null
                                    : taskDetailsCubit
                                        .getMissionDetails(item.id ?? 0);
                                CustomNavigator.instance
                                    .pushNamed(Routes.taskDetailsScreen)
                                    .then((value) {
                                  context.read<HomeCubit>().getMissionsList();
                                });
                                CacheHelper.saveData(
                                    key: MyCashKey.missionId,
                                    value: item.id ?? 0);
                              });
                        },
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
