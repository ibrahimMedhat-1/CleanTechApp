import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TaskDetailsAppBar extends AppBar {
  TaskDetailsAppBar({super.key, required BuildContext context})
      : super(
          leading: Container(
            alignment: Alignment.center,
            child: Text(
              AppStrings.taskDetails.tr(context),
              textAlign: TextAlign.center,
              style: FontStyles.interSize18_500Black.copyWith(
                  color: AppColors.white, fontWeight: FontWeight.w700),
            ),
          ),
          actions: [
            Assets.svgs.logoWhite.svg(width: 120.w),
            const CustomBackButton(),
          ],
          leadingWidth: 150.w,
        );
}
