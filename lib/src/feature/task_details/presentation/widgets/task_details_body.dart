import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/feature/task_details/presentation/widgets/dialog/administration_dialog.dart';

class TaskDetailsBody extends StatelessWidget {
  const TaskDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(),
          BaseText(
            title: AppStrings.placeName.tr(context),
            subTitle: "اسم المكان المقصود",
          ),
          19.isHeight,
          BaseText(
            title: AppStrings.placeAddress.tr(context),
            subTitle: "عنوان المكان المقصود",
          ),
          19.isHeight,
          BaseText(
            title: AppStrings.taskDetails.tr(context),
            subTitle:
                "التوجة الي المكان المقصود\n  و بدا تفريغ الحاوية و اتمام ما هو مطلوب ",
          ),
          38.isHeight,
          StepsWidget(),
          24.isHeight,
          Row(
            children: [
              Expanded(
                flex: 2,
                child: ButtonWidget(
                  text: AppStrings.clientApproached.tr(context),
                ),
              ),
              24.isWight,
              Expanded(
                child: ButtonWidget(
                  onPressed: () => showAdaptiveDialog(
                    context: context,
                    builder: (context) => AdministrationDialog(),
                  ),
                  text: "${AppStrings.administration.tr(context)} 📞",
                ),
              ),
            ],
          ),
          70.isHeight
        ],
      ),
    );
  }
}
