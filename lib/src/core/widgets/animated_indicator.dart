import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class AnimatedCircularProgressIndicator extends StatelessWidget {
  const AnimatedCircularProgressIndicator({
    Key? key,
    required this.percentage,
    // required this.label,
  }) : super(key: key);

  final double percentage;

  // final String label;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: percentage),
        duration: const Duration(seconds: 1),
        builder: (context, double value, child) => Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: value,
              color: AppColors.primary3,
              strokeWidth: 10,
              strokeCap: StrokeCap.round,
              backgroundColor: AppColors.gray3,
            ),
            Center(
              child: Text(
                "${(value * 100).toInt()}%",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
