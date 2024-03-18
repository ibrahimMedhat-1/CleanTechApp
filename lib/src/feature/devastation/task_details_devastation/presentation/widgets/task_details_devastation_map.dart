import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TaskDetailsDevastationMap extends StatefulWidget {
  TaskDetailsDevastationMap({super.key, required this.lat, required this.lng});

  final double lat;
  final double lng;

  @override
  State<TaskDetailsDevastationMap> createState() => _TaskDetailsDevastationMapState();
}

class _TaskDetailsDevastationMapState extends State<TaskDetailsDevastationMap> {
  final mapCubit = sl<MapCubit>();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    mapCubit.goToSelectedLocation(lat: widget.lat, lng: widget.lng);
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: mapCubit,
      child: SizedBox(
        width: 356.w,
        height: 204.h,
        child: BlocBuilder(
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
                  lat: widget.lat,
                  lng: widget.lng,
                  // lat: missionDetails.latitude ?? 0.0,
                  // lng: missionDetails.longitude ?? 0.0,
                ),
                onTap: (argument) {
                  AppFunctions().openMap(
                    lat: argument.latitude,
                    lng: argument.longitude,
                  );
                },
                onMapCreated: (GoogleMapController controller) async {
                  mapCubit.mapController.complete(controller);
                },
                markers: mapCubit.markers,
              ),
            );
          },
        ),
      ),
    );
  }
}
