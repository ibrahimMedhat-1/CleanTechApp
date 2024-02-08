
import 'package:ct_clean/src/core/config/routes/app_imports.dart';

extension CustomThemeExtension on BuildContext{
 
TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;
TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;

}