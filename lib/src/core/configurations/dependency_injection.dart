import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/feature/auth/login/logic/data/login_repo_impl.dart';
import 'package:ct_clean/src/feature/home/logic/data/home_repo.dart';
import 'package:ct_clean/src/feature/home/logic/data/home_repo_impl.dart';
import 'package:ct_clean/src/feature/profile/logic/data/profile_repo_impl.dart';
import 'package:ct_clean/src/feature/profile/presentation/manager/profile_cubit.dart';
import 'package:ct_clean/src/feature/task_details/logic/data/task_details_repo.dart';
import 'package:ct_clean/src/feature/task_details/logic/data/task_details_repo_impl.dart';
import 'package:ct_clean/src/feature/task_details/presentation/manager/map/map_cubit.dart';
import 'package:ct_clean/src/feature/task_details/presentation/manager/task_details_cubit/task_details_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setUpLocators() async {
  // api service
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<ApiService>(ApiService(sl<Dio>()));
  // Login
  sl.registerFactory<LoginRepo>(() => LoginRepoImpl(sl()));
  sl.registerLazySingleton<LoginCubit>(() => LoginCubit(sl()));

  // Home
  sl.registerFactory<HomeRepo>(() => HomeRepoImpl(sl()));
  sl.registerFactory<HomeCubit>(() => HomeCubit(sl())..getMissionsList());
  // Map Cubit
  sl.registerLazySingleton<MapCubit>(
    () => MapCubit()
      ..askUserToEnableLocation()
      ..getCurrentLocation(),
  );
  // Task Details Cubit
  sl.registerFactory<TaskDetailsRepo>(() => TaskDetailsRepoImpl(sl()));
  sl.registerLazySingleton<TaskDetailsCubit>(() => TaskDetailsCubit(sl()));
  // Profile
  sl.registerFactory<ProfileRepo>(() => ProfileRepoImpl(sl()));
  sl.registerLazySingleton<ProfileCubit>(
    () => ProfileCubit(sl())
      ..getProfile(UserLocal.driverId ?? 0)
      ..getContacts(),
  );
}
