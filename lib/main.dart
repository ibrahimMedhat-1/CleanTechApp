
import 'package:ct_clean/src/core/config/routes/app_imports.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocators();
  await CacheHelper.initCacheHelper();
   Bloc.observer = MyBlocObserver();
  runApp(  MyApp());
}
