import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TaskDevastationList extends StatelessWidget {
  TaskDevastationList({super.key});

  final homeDevastationCubit = sl<HomeDevastationCubit>();

  // final taskDD = sl<TaskDetailsDevastationCubit>();
  final mapCubit = sl<MapCubit>();
  final getMissionDetailsInHomeDevastation = true;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: homeDevastationCubit),
        // BlocProvider.value(value: taskDD),
        BlocProvider.value(value: mapCubit),
      ],
      child: BlocBuilder<HomeDevastationCubit, HomeDevastationState>(
        builder: (context, state) {
          var list = homeDevastationCubit.listMissions;
          return Expanded(
            child: list == null
                ? const LoadingWidget()
                : RefreshIndicator(
                    onRefresh: () async =>
                        homeDevastationCubit.getDevastationMission(),
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        MissionDevastationModel item = list[index];
                        return TaskDevastationItem(
                          item: item,
                          onPress: () {
                            // taskDD.getMissionDevastationDetails(item.id ?? 0);
                            CustomNavigator.instance
                                .pushNamed(Routes.taskDetailsDevastationScreen,
                                    arguments: item.id ?? 0)
                                .then((value) {
                              mapCubit.markers.clear();
                              homeDevastationCubit.getDevastationMission();
                            });
                          },
                        );
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }
}
