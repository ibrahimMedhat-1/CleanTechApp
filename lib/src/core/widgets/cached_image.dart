 import 'package:cached_network_image/cached_network_image.dart';
import 'package:ct_clean/gen/assets.gen.dart';
import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    this.borderRadius,
    this.link,
    this.width,
    this.height,
    this.fit,
    this.customBorder,
  });

  final double? borderRadius;
  final String? link;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadiusGeometry? customBorder;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: customBorder ?? BorderRadius.circular(borderRadius ?? 50),
      child: link != null
          ? CachedNetworkImage(
              imageUrl: link!,
              width: width ?? 30,
              height: height ?? 30,
              fit: fit,
              // placeholder: (context, url) {
              //   return Assets.lottie.noImageLottie.lottie();
              // },
              // errorWidget: (context, url, error) {
              //   return Padding(
              //     padding: const EdgeInsetsDirectional.all(30),
              //     child: Assets.lottie.empty.lottie(),
              //   );
              // },
            )
          : Container(
              width: width ?? 30,
              height: height ?? 30,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8),
            ),
    );
  }
}
