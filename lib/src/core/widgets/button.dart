import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/config/theme/font_styles/font_styles.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.onPressed,
    this.color,
    this.text,
    // this.textColor = Colors.white,
    this.height,
    this.width,
    this.child,
    this.borderColor,
    this.hasElevation = false,
    this.loading = false,
    this.loadingColor,
    this.borderRadius = 24,
    this.fontStyle,
    this.decorationColor,
    this.margin,
    this.padding,
    this.buttonHeight,
  }) : assert(child != null || text != null);
  final Function()? onPressed;
  final Color? color;
  final String? text;
  final double? height;
  final double? width;
  final Widget? child;
  final Color? borderColor;
  // final Color textColor;
  final bool hasElevation;
  final bool loading;
  final Color? loadingColor;
  final Color? decorationColor;
  final double borderRadius;
  final double? buttonHeight;
  final TextStyle? fontStyle;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: buttonHeight,
      decoration: BoxDecoration(
          color: decorationColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            if (hasElevation)
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.15),
              )
          ]),
      child: MaterialButton(
        elevation: 0,
        onPressed: onPressed,
        color: loading ? AppColors.primary.withOpacity(0.5) : color ?? AppColors.primary,
        disabledTextColor: Colors.red,
        minWidth: width ?? MediaQuery.sizeOf(context).width,
        height: height ?? 49,
        disabledColor: color ?? AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: borderColor != null
              ? BorderSide(
                  color: borderColor!,
                )
              : BorderSide.none,
        ),
        splashColor: color,
        focusColor: color,
        highlightColor: color,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 12),
        child: loading
            ? SizedBox(
                width: width,
                height: height,
                child: Center(
                  child:
                      // Assets.images.loadingRecycle
                      //     .lottie(width: 50.w, height: 50.h)
                      CircularProgressIndicator(
                    color: loadingColor ?? Colors.white,
                  ),
                ),
              )
            : text != null
                ? Text(
                    text ?? '',
                    style: fontStyle ?? TextStyle(color: AppColors.white),
                  )
                : child,
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.onPress,
    this.child
  });
  final VoidCallback? onPress;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: child,
    );
  }
}
