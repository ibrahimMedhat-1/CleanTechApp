import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:flutter/cupertino.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  IconButton(
      onPressed: () => CustomNavigator.instance.pop(),
      icon: Icon(
        CupertinoIcons.forward,
        color: AppColors.white,
        size: 40.sp,
      ),
    );
  }
}
