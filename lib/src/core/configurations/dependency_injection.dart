import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/feature/task_details/presentation/manager/map/map_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setUpLocators() async {
  // api service
  // getIt.registerSingleton(Dio());
  // getIt.registerSingleton<ApiService>(ApiService(getIt.get<Dio>()));

  sl.registerFactory<LoginCubit>(() => LoginCubit());

  sl.registerFactory<HomeCubit>(() => HomeCubit());
  // Map Cubit
  sl.registerFactory<MapCubit>(
    () => MapCubit()
      ..askUserToEnableLocation()
      ..getCurrentLocation(),
  );
}
