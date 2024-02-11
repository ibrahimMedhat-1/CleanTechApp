import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        appBar: AppBar(
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
            Assets.images.logoWhite.image(),
            const CustomBackButton(),
          ],
          leadingWidth: 150.w,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 40.w),
          child: ListView(
            children: [
              24.isHeight,
              Row(),
              TaskDetailsMap(),
              60.isHeight,
              TaskDetailsBody(),

            ],
          ),
        ));
  }
}
