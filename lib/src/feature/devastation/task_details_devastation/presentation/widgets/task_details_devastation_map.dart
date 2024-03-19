import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TaskDetailsDevastationMap extends StatefulWidget {
  TaskDetailsDevastationMap({
    super.key,
    // required this.lat,
    // required this.lng,
  });

  // final double lat;
  // final double lng;

  @override
  State<TaskDetailsDevastationMap> createState() =>
      _TaskDetailsDevastationMapState();
}

class _TaskDetailsDevastationMapState extends State<TaskDetailsDevastationMap> {
  final mapCubit = sl<MapCubit>();
  final taskDDC = sl<TaskDetailsDevastationCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // mapCubit.drawMarker(
    //   lat: taskDDC.detailsMissionModel?.latitude ?? 0.0,
    //   lng: taskDDC.detailsMissionModel?.longitude ?? 0.0,
    // );
    // mapCubit.goToSelectedLocation(
    //   lat: taskDDC.detailsMissionModel?.latitude ?? 0.0,
    //   lng: taskDDC.detailsMissionModel?.longitude ?? 0.0,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: mapCubit),
        BlocProvider.value(value: taskDDC),
      ],
      child: SizedBox(
        width: 356.w,
        height: 204.h,
        child: BlocConsumer(
          bloc: taskDDC,
          listener: (context, state) {
            if (state is GetTaskDevastationDetailsSuccess) {
              mapCubit.drawMarker(
                  lat: state.r?.latitude ?? 0.0, lng: state.r?.longitude ?? 0.0);
            }
          },
          builder: (context, state) {
            var model = taskDDC.detailsMissionModel;
            return state is GetTaskDevastationDetailsLoading
                ? const LoadingWidget()
                : BlocBuilder(
                    bloc: mapCubit,
                    builder: (context, state) {
                      return Card(
                        elevation: 10,
                        child: GoogleMap(
                          padding: EdgeInsets.all(10.w),
                          mapType: MapType.terrain,
                          myLocationEnabled: true,
                          zoomControlsEnabled: false,
                          myLocationButtonEnabled: false,
                          initialCameraPosition:
                              mapCubit.setCurrentLocationCameraPosition(
                            lat: model?.latitude ?? 0.0,
                            lng: model?.longitude ?? 0.0,
                          ),
                          onTap: (argument) {
                            AppFunctions().openMap(
                              lat: model?.latitude ?? argument.latitude,
                              lng: model?.latitude ?? argument.longitude,
                            );
                          },
                          onMapCreated: (GoogleMapController controller) async {
                            mapCubit.mapController.complete(controller);
                          },
                          markers: mapCubit.markers,
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
