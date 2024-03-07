import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/feature/auth/login/logic/data/login_repo_impl.dart';
import 'package:ct_clean/src/feature/home/logic/data/home_repo.dart';
import 'package:ct_clean/src/feature/home/logic/data/home_repo_impl.dart';
import 'package:ct_clean/src/feature/profile/logic/data/profile_repo_impl.dart';
import 'package:ct_clean/src/feature/profile/presentation/manager/profile_cubit.dart';
import 'package:ct_clean/src/feature/salary_details/logic/data/salary_details_repo.dart';
import 'package:ct_clean/src/feature/salary_details/logic/data/salary_details_repo_impl.dart';
import 'package:ct_clean/src/feature/salary_details/presentation/manager/salary_cubit.dart';
import 'package:ct_clean/src/feature/schedule_previous_tasks/logic/data/old_missions_repo_impl.dart';
import 'package:ct_clean/src/feature/schedule_previous_tasks/presentation/manager/old_mission_cubit.dart';
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
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(sl()));
  sl.registerLazySingleton<HomeCubit>(() => HomeCubit(sl())..getMissionsList());
  // Map Cubit
  sl.registerLazySingleton<MapCubit>(
    () => MapCubit(sl())
      ..askUserToEnableLocation()

      // ..getStreamLocation(),
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
  //salary
  sl.registerFactory<SalaryDetailsRepo>(() => SalaryDetailsRepoImpl(sl()));
  sl.registerLazySingleton<SalaryCubit>(() => SalaryCubit(sl()));
  // Old Missions
  sl.registerFactory<OldMissionRepo>(() => OldMissionRepoImpl(sl()));
  sl.registerFactory<OldMissionCubit>(() => OldMissionCubit(sl()));
}
