
import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.color,
    this.backgroundColor,
  });
  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? AppColors.primary,
        backgroundColor: backgroundColor ?? AppColors.white,
      ),
    );
  }
}
