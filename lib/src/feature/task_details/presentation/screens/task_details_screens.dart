import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TaskDetailsScreen extends StatelessWidget {
  TaskDetailsScreen({super.key});

  final taskDetailsCubit = sl<TaskDetailsCubit>();

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
            Assets.svgs.logoWhite.svg(width: 120.w),
            const CustomBackButton(),
          ],
          leadingWidth: 150.w,
        ),
        body: BlocProvider.value(
          value: taskDetailsCubit,
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 40.w),
            child: RefreshIndicator(
            onRefresh: ()async {
              taskDetailsCubit.getMissionDetails(taskDetailsCubit.missionDetailsModel?.id ?? 0);
            },
              child: ListView(
                children: [
                  24.isHeight,
                  const Row(),
                  TaskDetailsMap(),
                  60.isHeight,
                  TaskDetailsBody(),
                ],
              ),
            ),
          ),
        ));
  }
}
