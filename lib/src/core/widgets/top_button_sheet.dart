import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TopButtonSheet extends StatelessWidget {
  const TopButtonSheet({super.key, this.topPadding});

  final int? topPadding;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 36.w,
        height: 4,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // color: AppColors.textColor,
          borderRadius: BorderRadius.circular(50.r),
        ),
      ),
    );
  }
}
