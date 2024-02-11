import 'package:ct_clean/src/core/config/locale/app_localizations_setup.dart';
import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/config/routes/app_router.dart';
import 'package:ct_clean/src/core/config/routes/navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          navigatorKey: navigationKey,
          locale: Locale("ar"),
          supportedLocales: AppLocalizationsSetup.supportedLocales,
          localeResolutionCallback:
          AppLocalizationsSetup.localeResolutionCallback,
          localizationsDelegates:
          AppLocalizationsSetup.localizationsDelegates,

          onGenerateRoute: AppRouter().generateRoute,
          initialRoute: Routes.loginScreen,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.primary
            ),
            iconTheme: IconThemeData(
              color: AppColors.primary
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
