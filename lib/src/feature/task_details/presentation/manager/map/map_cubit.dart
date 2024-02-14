import 'dart:async';
import 'package:ct_clean/src/core/config/routes/app_imports.dart';
part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());

  // Maps
// To OPen location and get Permission
  void askUserToEnableLocation() {
    emit(EnableLocationLoading());
    try {
      LocationHelper().isLocationEnabled();
      LocationHelper().getPermissionLocation();
      emit(EnableLocationSuccess());
      getCurrentLocation();
    } catch (e) {
      emit(EnableLocationError());
    }
  }

  LatLng? latLng;
  Position? position;

  void getCurrentLocation() {
    emit(GetCurrentLocationLoading());
    LocationHelper.getCurrentLocation().then((value) {
      position = value;
      latLng = LatLng(value.latitude, value.longitude);
      emit(GetCurrentLocationSuccess());
    }).catchError((e) {
      emit(GetCurrentLocationError());
    });
  }

  final Completer<GoogleMapController> mapController = Completer();

  CameraPosition setCurrentLocationCameraPosition() {
    final CameraPosition _myCurrentLocationCameraPoition = CameraPosition(
      target: LatLng(
        position!.latitude,
        position!.longitude,
      ),
      bearing: 0.0,
      tilt: 0.0,
      zoom: 12,
    );
    return _myCurrentLocationCameraPoition;
  }

  Future<void> goToSelectedLocation(
      {required double lat, required double lng}) async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(getSelectionCameraPosition(
      lat: lat,
      lng: lng,
    )));
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

  void onCameraMove(CameraPosition cameraPosition) {
    latLng = cameraPosition.target;

    print("cameraPosition ${cameraPosition.target.latitude}");
    currentMarker = Marker(
      markerId: const MarkerId("1"),
      onTap: () {},
      position: LatLng(
          cameraPosition.target.latitude, cameraPosition.target.longitude),
      infoWindow: const InfoWindow(title: "Location"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    addMarker(currentMarker);
  }

  Set<Marker> markers = {};

  void addMarker(Marker marker) {
    markers.add(marker);
    emit(AddMarkerSuccessInBranches());
  }
}
