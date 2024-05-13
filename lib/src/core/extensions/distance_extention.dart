import 'package:ct_clean/src/core/config/routes/app_imports.dart';

extension Distance on int {
  Widget get isHeight => SizedBox(height: this.h);
  Widget get isWidth => SizedBox(width: this.h);
}
