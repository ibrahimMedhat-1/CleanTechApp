import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/config/theme/colors/hex_colors.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static generate(String fontFamily) {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppColors.primary,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        titleSpacing: 0,
        iconTheme: IconThemeData(color: AppColors.black, size: 24.w),
        // titleTextStyle: FontStyles.styleRegular22,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.primary,
            statusBarIconBrightness: Brightness.dark),
      ),
      disabledColor: Colors.black,
      dividerTheme: DividerThemeData(
        space: 1,
        color: HexColor("#CFCFCF"),
      ),
      fontFamily: fontFamily,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(
          AppColors.primary.value,
          {
            50: AppColors.primary.withOpacity(0.1),
            100: AppColors.primary.withOpacity(0.2),
            200: AppColors.primary.withOpacity(0.3),
            300: AppColors.primary.withOpacity(0.4),
            400: AppColors.primary.withOpacity(0.5),
            500: AppColors.primary.withOpacity(0.6),
            600: AppColors.primary.withOpacity(0.7),
            700: AppColors.primary.withOpacity(0.8),
            800: AppColors.primary.withOpacity(0.9),
            900: AppColors.primary.withOpacity(1),
          },
        ),
        accentColor: AppColors.primary,
      ).copyWith(background: Colors.white),
    );
  }
}
