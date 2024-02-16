import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final loginCubit = sl<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: loginCubit,
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
                localeResolutionCallback:
                    AppLocalizationsSetup.localeResolutionCallback,
                localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
                onGenerateRoute: AppRouter().generateRoute,
                initialRoute: UserLocal.driverId == null
                    ? Routes.loginScreen
                    : Routes.layoutScreen,
                theme: ThemeData(
                  fontFamily: "Almarai",
                  appBarTheme: AppBarTheme(backgroundColor: AppColors.primary),
                  iconTheme: IconThemeData(color: AppColors.primary),
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: AppColors.primary),
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
