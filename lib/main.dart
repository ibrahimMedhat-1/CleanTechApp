
import 'package:ct_clean/src/core/config/routes/app_imports.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocators();
  await CacheHelper.initCacheHelper();
  print(UserLocal.lang);
   Bloc.observer = MyBlocObserver();
  runApp(  MyApp());
}
