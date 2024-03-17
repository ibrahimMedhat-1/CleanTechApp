import 'package:ct_clean/src/core/configurations/shared_preferences.dart';

class UserLocal {
  static String? get token => CacheHelper.getData(key: MyCashKey.token);
  static String? get lang => CacheHelper.getData(key: MyCashKey.lang);
  static int? get driverId => CacheHelper.getData(key: MyCashKey.driverId);
  static int? get missionId => CacheHelper.getData(key: MyCashKey.missionId);
  static String? get driverName => CacheHelper.getData(key: MyCashKey.driverName);
  static String? get image => CacheHelper.getData(key: MyCashKey.image);
  static int? get type =>CacheHelper.getData(key: MyCashKey.type);

}
