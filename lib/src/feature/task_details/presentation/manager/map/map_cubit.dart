import 'dart:async';
import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/functions/functions.dart';
import 'package:dartz/dartz.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit(this.repo) : super(MapInitial());
  TaskDetailsRepo repo;

  // Maps
  // To OPen location and get Permission
  void askUserToEnableLocation() {
    emit(EnableLocationLoading());
    try {
      LocationHelper().isLocationEnabled();
      LocationHelper().getPermissionLocation();
      emit(EnableLocationSuccess());
    } catch (e) {
      emit(EnableLocationError());
    }
  }

  LatLng? latLng;
  Position? position;

  // void getCurrentLocation() {
  //   emit(GetCurrentLocationLoading());
  //   LocationHelper.getCurrentLocation().then((value) {
  //     position = value;
  //     latLng = LatLng(value.latitude, value.longitude);
  //     emit(GetCurrentLocationSuccess());
  //   }).catchError((e) {
  //     emit(GetCurrentLocationError());
  //   });
  // }
  void getStreamLocation() {
    emit(GetStreamLocationLoading());
    LocationHelper.getStreamLocation().listen((value) {
      position = value;
      latLng = LatLng(value.latitude, value.longitude);
      print("latitude getStreamLocation  ${value.latitude}");
      sendStreamLocation(lat: value.latitude, lng: value.longitude);
      emit(GetStreamLocationSuccess());
    }).onError((e) {
      emit(GetStreamLocationError());
    });
  }

  void sendStreamLocation({required double lat, required double lng}) async {
    emit(SendStreamLocationLoading());

    Either<Failures, GlobalModel> result = await repo.sendStreamPosition(
      StreamPositionParams(lat: lat, lng: lng),
    );
    result.fold((l) {
      emit(SendStreamLocationError());
      print(l.errMessage);
    }, (r) {
      emit(SendStreamLocationSuccess());
    });
  }

  final Completer<GoogleMapController> mapController = Completer();

  CameraPosition setCurrentLocationCameraPosition(
      {required double lat, required double lng}) {
    print(lat);
    print(lng);
    final CameraPosition _myCurrentLocationCameraPoition = CameraPosition(
      target: LatLng(lat, lng),
      bearing: 0.0,
      tilt: 0.0,
      zoom: 14,
    );

    // markers.clear();
    // if (markers.isEmpty) {
    //   currentMarker = Marker(
    //     markerId: const MarkerId("1"),
    //     onTap: () => AppFunctions().openMap(
    //       lat: lat,
    //       lng: lng,
    //     ),
    //     position: LatLng(lat, lng),
    //     infoWindow: const InfoWindow(title: "Location"),
    //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    //   );
    //
    //   addMarker(currentMarker);
    // }

    return _myCurrentLocationCameraPoition;
  }

  void drawMarker({required double lat, required double lng}) {
    currentMarker = Marker(
      markerId: const MarkerId("1"),
      onTap: () => AppFunctions().openMap(lat: lat, lng: lng),
      position: LatLng(lat, lng),
      infoWindow: const InfoWindow(title: "Location"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    markers.add(currentMarker);
    emit(AddMarkerSuccessInBranches());
  }

  Future<void> goToSelectedLocation(
      {required double lat, required double lng}) async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        getSelectionCameraPosition(
          lat: lat,
          lng: lng,
        ),
      ),
    );
    if (markers.isEmpty) {
      currentMarker = Marker(
        markerId: const MarkerId("1"),
        onTap: () => AppFunctions().openMap(
          lat: lat,
          lng: lng,
        ),
        position: LatLng(lat, lng),
        infoWindow: const InfoWindow(title: "Location"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      );
      addMarker(currentMarker);
    }
  }

  CameraPosition getSelectionCameraPosition(
      {required double lat, required double lng}) {
    final CameraPosition selectCameraPosition = CameraPosition(
      target: LatLng(lat, lng),
      bearing: 0.0,
      tilt: 0.0,
      zoom: 12,
    );
    return selectCameraPosition;
  }

  late Marker currentMarker;

  // void onCameraMove(CameraPosition cameraPosition) {
  //   latLng = cameraPosition.target;
  //
  //   print("cameraPosition ${cameraPosition.target.latitude}");
  //   currentMarker = Marker(
  //     markerId: const MarkerId("1"),
  //     onTap: () {},
  //     position: LatLng(
  //         cameraPosition.target.latitude, cameraPosition.target.longitude),
  //     infoWindow: const InfoWindow(title: "Location"),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  //   );
  //   addMarker(currentMarker);
  // }

  Set<Marker> markers = {};

  void addMarker(Marker marker) {
    markers.add(marker);
    emit(AddMarkerSuccessInBranches());
  }
}
