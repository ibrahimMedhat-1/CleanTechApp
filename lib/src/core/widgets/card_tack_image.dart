 

import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class CardTackImage extends StatelessWidget {
  const CardTackImage(
      {super.key,
      required this.name,
      required this.icon,
      required this.onPressed});
  final String name;
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ElevatedButton.icon(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(10),
          padding:
              MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15.h)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.sp))),
          backgroundColor: MaterialStateProperty.all(AppColors.white),
        ),
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        label: Text(
          name,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
