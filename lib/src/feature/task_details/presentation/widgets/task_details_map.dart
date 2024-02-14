import '../../../../core/config/routes/app_imports.dart';

class TaskDetailsMap extends StatefulWidget {
  const TaskDetailsMap({super.key});

  @override
  State<TaskDetailsMap> createState() => _TaskDetailsMapState();
}

class _TaskDetailsMapState extends State<TaskDetailsMap> {
  final mapCubit = sl<MapCubit>();

  @override
  void initState() {
    super.initState();
    mapCubit.askUserToEnableLocation();
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
          child: BlocConsumer<MapCubit, MapState>(
            bloc: mapCubit,
            listener: (context, state) {
              if (state is GetCurrentLocationError) {
                mapCubit.getCurrentLocation();
              }
            },
            builder: (context, state) {
              var cubit = context.read<MapCubit>();
              var position = cubit.position;

              return position == null
                  ? const Center(child: CircularProgressIndicator())
                  : GoogleMap(
                      padding: EdgeInsets.all(10.w),
                      mapType: MapType.terrain,
                      myLocationEnabled: true,
                      zoomControlsEnabled: false,
                      myLocationButtonEnabled: false,
                      initialCameraPosition:
                          cubit.setCurrentLocationCameraPosition(),
                      onMapCreated: (GoogleMapController controller) async =>
                          cubit.mapController.complete(controller),
                      // markers: cubit.markers,
                      // onCameraMove: cubit.onCameraMove,
                    );
            },
          ),
        ),
      ),
    );
  }
}
