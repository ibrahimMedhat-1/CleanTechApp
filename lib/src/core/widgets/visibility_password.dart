import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class VisibilityPassword extends StatelessWidget {
  const VisibilityPassword({
    super.key,
    this.onPress,
    required this.pass,
  });

  final VoidCallback? onPress;
  final bool pass;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Visibility(
        visible: !pass,
        replacement:
            Assets.svgs.visibilityOffField.svg(width: 24.w, height: 24.h),
        child: Assets.svgs.visibilityField.svg(height: 24.h, width: 24.w),
      ),
    );
  }
}
