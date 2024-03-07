import 'dart:convert';

import 'package:ct_clean/src/core/functions/functions.dart';
import 'package:ct_clean/src/core/widgets/loading.dart';

import '../../../../core/config/routes/app_imports.dart';

class TaskDetailsMap extends StatefulWidget {
  const TaskDetailsMap({
    super.key,
  });

  @override
  State<TaskDetailsMap> createState() => _TaskDetailsMapState();
}

class _TaskDetailsMapState extends State<TaskDetailsMap> {
  final mapCubit = sl<MapCubit>();

  @override
  void initState() {
    super.initState();
    mapCubit.askUserToEnableLocation();
    // mapCubit.goToSelectedLocation(
    //     lat: widget.item.latitude ?? 0.0, lng: widget.item.longitude ?? 0.0);
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
          child: BlocBuilder<TaskDetailsCubit, TaskDetailsState>(
            builder: (context, state) {
              var taskDCubit = context.read<TaskDetailsCubit>();
              var missionDetails = taskDCubit.missionDetailsModel;
              return missionDetails == null
                  ? const LoadingWidget()
                  : BlocConsumer<MapCubit, MapState>(
                      bloc: mapCubit,
                      listener: (context, state) {},
                      builder: (context, state) {
                        var cubit = context.read<MapCubit>();
                        var position = missionDetails.latitude != null &&
                                missionDetails.longitude != null
                            ? LatLng(missionDetails.latitude!,
                                missionDetails.longitude!)
                            : null;

                        return position == null
                            ? const Center(child: CircularProgressIndicator())
                            : GoogleMap(
                                padding: EdgeInsets.all(10.w),
                                mapType: MapType.terrain,
                                myLocationEnabled: true,
                                zoomControlsEnabled: false,
                                myLocationButtonEnabled: false,
                                initialCameraPosition:
                                    cubit.setCurrentLocationCameraPosition(
                                        lat: missionDetails.latitude ?? 0.0,
                                        lng: missionDetails.longitude ?? 0.0),
                                onTap: (argument) {
                                  AppFunctions().openMap(
                                    lat: argument.latitude,
                                    lng: argument.longitude,
                                  );
                                },
                                onMapCreated:
                                    (GoogleMapController controller) async {
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
