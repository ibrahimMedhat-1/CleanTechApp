import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class BaseText extends StatelessWidget {
  const BaseText({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: title,
            style: FontStyles.interSize18_400Primary.copyWith(fontSize: 16.sp),
          ),
          TextSpan(
            text: subTitle,
            style: FontStyles.interSize13_400Black,
          ),
        ],
      ),
    );
  }
}
