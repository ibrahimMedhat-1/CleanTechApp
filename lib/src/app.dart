import 'package:ct_clean/src/core/config/routes/app_imports.dart';

import 'core/services/background_service/background_service.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final loginCubit = sl<LoginCubit>();

  final TaskDetailsCubit taskDetailsCubit = sl<TaskDetailsCubit>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  late AppLifecycleState _appLifecycleState;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    setState(() {
      _appLifecycleState = state;
      print("_appLifecycleState $_appLifecycleState");
      if (_appLifecycleState == AppLifecycleState.resumed) {
        callBackground();
      }
    });
  }

  void callBackground() async {
    await initializeServices();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: loginCubit),
        BlocProvider.value(value: taskDetailsCubit),
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        builder: (context, child) {
          return BlocBuilder<LoginCubit, LoginState>(
            bloc: loginCubit,
            builder: (context, state) {
              return MaterialApp(
                title: 'Clean Tech',
                debugShowCheckedModeBanner: false,
                navigatorKey: navigationKey,
                locale: Locale(UserLocal.lang ?? "ar"),
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
                localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
                onGenerateRoute: AppRouter().generateRoute,
                initialRoute: Routes.loginScreen,
                theme: ThemeData(
                  fontFamily: "Almarai",
                  appBarTheme: AppBarTheme(backgroundColor: AppColors.primary),
                  iconTheme: IconThemeData(color: AppColors.primary),
                  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
                  useMaterial3: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
