import 'package:ct_clean/src/core/configurations/shared_preferences.dart';

class UserLocal {
  static String? get token => CacheHelper.getData(key: MyCashKey.token);

}
