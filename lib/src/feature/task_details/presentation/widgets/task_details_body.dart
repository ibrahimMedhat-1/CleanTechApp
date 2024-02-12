import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TaskDetailsBody extends StatelessWidget {
  TaskDetailsBody({super.key});

  final taskDetailsCubit = sl<TaskDetailsCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: taskDetailsCubit,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           SizedBox(
             height: 140.h,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   children: [
                     BaseText(
                       title: AppStrings.placeName.tr(context),
                       subTitle: "اسم المكان المقصود",
                     ),
                     Assets.images.placeLogo.image()
                   ],
                 ),
                 19.isHeight,
                 BaseText(
                   title: AppStrings.placeAddress.tr(context),
                   subTitle: "عنوان المكان المقصود",
                 ),
                 19.isHeight,
                 BaseText(
                   title: "${AppStrings.taskDetails.tr(context)} : ",
                   subTitle:
                   "التوجة الي المكان المقصود  و بدا تفريغ الحاوية و اتمام ما هو مطلوب ",
                 ),
               ],
             ),
           ),
            19.isHeight,
            BlocBuilder(
              bloc: taskDetailsCubit,
              builder: (context, state) {
                return StepsWidget(
                  currentIndex: taskDetailsCubit.currentStepIndex,
                );
              },
            ),
            24.isHeight,
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: BlocBuilder(
                    bloc: taskDetailsCubit,
                    builder: (context, state) => ButtonWidget(
                      text: AppStrings.clientApproached.tr(context),
                      onPressed: () {
                        // taskDetailsCubit.onChangeSteps();
                        showAdaptiveDialog(
                          context: context,
                          builder: (context) => ConfirmStepDialog(),
                        );
                      },
                    ),
                  ),
                ),
                24.isWight,
                Expanded(
                  child: ButtonWidget(
                    onPressed: () => showAdaptiveDialog(
                      context: context,
                      builder: (context) => ContactTheAdministrationDialog(),
                    ),
                    text: "${AppStrings.administration.tr(context)} 📞",
                  ),
                ),
              ],
            ),
            70.isHeight
          ],
        ),
      ),
    );
  }
}
