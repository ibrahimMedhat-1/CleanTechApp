import '../../../../core/config/routes/app_imports.dart';

class TaskDetailsMap extends StatefulWidget {
  const TaskDetailsMap({super.key});

  @override
  State<TaskDetailsMap> createState() => _TaskDetailsMapState();
}

class _TaskDetailsMapState extends State<TaskDetailsMap> {
  final mapCubit = sl<MapCubit>();
  final taskDetailsCubit = sl<TaskDetailsCubit>();

  @override
  void initState() {
    super.initState();
    mapCubit.askUserToEnableLocation();
    taskDetailsCubit.getMissionDetails(UserLocal.missionId ?? 0);
    // mapCubit.goToSelectedLocation(lat: widget.lat, lng: widget.lng);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: mapCubit,
      child: SizedBox(
        width: 356.w,
        height: 204.h,
        child: Card(
          elevation: 10,
          child: BlocConsumer<TaskDetailsCubit, TaskDetailsState>(
            listener: (context, state) {
              if (state is GetMissionDetailsSuccess) {
                mapCubit.drawMarker(
                  lat: state.missionDetailsModel.latitude ?? 0.0,
                  lng: state.missionDetailsModel.longitude ?? 0.0,
                );
              }
            },
            builder: (context, state) {
              var taskDCubit = context.read<TaskDetailsCubit>();
              var model = taskDCubit.missionDetailsModel;
              return model == null || state is GetMissionDetailsLoading
                  ? const LoadingWidget()
                  : BlocConsumer<MapCubit, MapState>(
                      bloc: mapCubit,
                      listener: (context, state) {},
                      builder: (context, state) {
                        var cubit = context.read<MapCubit>();

                        return GoogleMap(
                          padding: EdgeInsets.all(10.w),
                          mapType: MapType.terrain,
                          myLocationEnabled: true,
                          zoomControlsEnabled: false,
                          myLocationButtonEnabled: false,
                          initialCameraPosition:
                              cubit.setCurrentLocationCameraPosition(
                            lat: model.latitude ?? 0.0,
                            lng: model.longitude ?? 0.0,
                          ),
                          onTap: (argument) {
                            AppFunctions().openMap(
                              lat: model.latitude ?? argument.latitude,
                              lng: model.latitude ?? argument.longitude,
                            );
                          },
                          onMapCreated: (GoogleMapController controller) async {
                            cubit.mapController.complete(controller);
                          },
                          markers: cubit.markers,
                        );
                      },
                    );
            },
          ),
        ),
      ),
    );
  }
}
