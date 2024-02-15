import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class BaseText extends StatelessWidget {
  const BaseText(
      {super.key,
      required this.title,
      required this.subTitle,
      this.textColor,
      this.subTitleFontSize});

  final String title;
  final String subTitle;
  final Color? textColor;
  final double? subTitleFontSize;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: title,
              style: FontStyles.interSize18_400Primary.copyWith(
                fontSize: 18.sp,
                color: textColor,
              ),
            ),
            TextSpan(
              text: subTitle,

              style: FontStyles.interSize13_400Black
                  .copyWith(fontSize: subTitleFontSize ?? 16.sp,overflow: TextOverflow.ellipsis ),
            ),
          ],
        ),
      ),
    );
  }
}
