
import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class BottomButtonSheet extends StatelessWidget {
  const BottomButtonSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 134.w,
        height: 4.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(50.r),
        ),
      ),
    );
  }
}
