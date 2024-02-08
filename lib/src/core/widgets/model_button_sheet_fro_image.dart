
import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/widgets/card_tack_image.dart';

class ShowModelBottomSheetImage extends StatelessWidget {
  const ShowModelBottomSheetImage({
    super.key,
    required this.galleryFunction,
    required this.cameraFunction,
  });
  final VoidCallback galleryFunction;
  final VoidCallback cameraFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15.sp),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 25.h),
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CardTackImage(
                name: 'Browse Gallery',
                icon: Icons.add_photo_alternate_rounded,
                onPressed: galleryFunction,
              ),
              SizedBox(height: 10.h),
              const Align(
                alignment: Alignment.center,
                child: Text('or'),
              ),
              SizedBox(height: 10.h),
              CardTackImage(
                name: 'Use a Camera',
                icon: Icons.camera,
                onPressed: cameraFunction,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
