import 'package:ct_clean/src/core/config/routes/app_imports.dart';

final sl = GetIt.instance;

Future<void> setUpLocators() async {
  // api service
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<ApiService>(ApiService(sl<Dio>()));
  // Login
  sl.registerFactory<LoginRepo>(() => LoginRepoImpl(sl()));
  sl.registerLazySingleton<LoginCubit>(() => LoginCubit(sl()));

  // Home
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(sl()));
  sl.registerLazySingleton<HomeCubit>(() => HomeCubit(sl())..getMissionsList());
  // Map Cubit
  sl.registerLazySingleton<MapCubit>(
      () => MapCubit(sl())..askUserToEnableLocation()

      // ..getStreamLocation(),
      );
  // Task Details Cubit
  sl.registerFactory<TaskDetailsRepo>(() => TaskDetailsRepoImpl(sl()));
  sl.registerLazySingleton<TaskDetailsCubit>(
    () => TaskDetailsCubit(sl())..getLocation(),
  );
  // Profile
  sl.registerFactory<ProfileRepo>(() => ProfileRepoImpl(sl()));
  sl.registerLazySingleton<ProfileCubit>(
    () => ProfileCubit(sl())
      ..getProfile(UserLocal.driverId ?? 0)
      ..getContacts(),
  );
  //salary
  sl.registerFactory<SalaryDetailsRepo>(() => SalaryDetailsRepoImpl(sl()));
  sl.registerLazySingleton<SalaryCubit>(() => SalaryCubit(sl()));
  // Old Missions
  sl.registerFactory<OldMissionRepo>(() => OldMissionRepoImpl(sl()));
  sl.registerLazySingleton<OldMissionCubit>(() => OldMissionCubit(sl()));

  // Devastation

  sl.registerLazySingleton<HomeDevastationRepo>(
      () => HomeDevastationRepoImpl(sl()));
  sl.registerLazySingleton<HomeDevastationCubit>(
    () => HomeDevastationCubit(sl())..getDevastationMission(),
  );

  sl.registerLazySingleton<TaskDetailsDevastationRepo>(
      () => TaskDetailsDevastationRepoImpl(sl()));
  sl.registerLazySingleton<TaskDetailsDevastationCubit>(
      () => TaskDetailsDevastationCubit(sl()));
}
