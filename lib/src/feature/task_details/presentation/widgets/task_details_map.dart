import '../../../../core/config/routes/app_imports.dart';

class TaskDetailsMap extends StatelessWidget {
  TaskDetailsMap({super.key});

  final mapCubit = sl<MapCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: mapCubit,
      child: SizedBox(
        width: 356.w,
        height: 204.h,
        child: Card(
          elevation: 10,
          child: BlocBuilder<MapCubit, MapState>(
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
