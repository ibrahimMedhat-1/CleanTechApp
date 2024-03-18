import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    this.dialogHeight,
    this.confirmTap,
    required this.child,
  });

  final double? dialogHeight;
  final Widget child;
  final VoidCallback? confirmTap;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 350.w,
            height: dialogHeight ?? MediaQuery.sizeOf(context).height * 0.4,
            child: Card(
              color: AppColors.primary2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: [
                  const DialogLogo(),
                  16.isHeight,
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                    child: child,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      10.isWight,
                      Expanded(
                        child: ButtonWidget(
                          text: AppStrings.back.tr(context),
                          onPressed: () => CustomNavigator.instance.pop(),
                        ),
                      ),
                      10.isWight,
                      Expanded(
                        child: ButtonWidget(
                          text: AppStrings.confirmStep.tr(context),
                          onPressed: confirmTap,
                        ),
                      ),
                      10.isWight,
                    ],
                  ),
                  20.isHeight
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
