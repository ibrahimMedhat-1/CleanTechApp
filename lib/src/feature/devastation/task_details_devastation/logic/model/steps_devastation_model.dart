import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class StepsDevastationDataModel {
  final String title;
  final Widget image;

  StepsDevastationDataModel({required this.image, required this.title});

  static List<StepsDataModel> listSteps(BuildContext context) => [
    StepsDataModel(
      image: Assets.images.goToClient.image(),
      title: AppStrings.theClientHasBeenApproached.tr(context),
    ),
    StepsDataModel(
      image: Assets.images.locationIcon.image(),
      title: AppStrings.haveBeenReached.tr(context),
    ),
    // StepsDataModel(
    //   image: Assets.images.carIcon.image(),
    //   title: AppStrings.beginningOfDischarge.tr(context),
    // ),
    // StepsDataModel(
    //   image: Assets.images.doneIcon.image(),
    //   title: AppStrings.beenCompleted.tr(context),
    // ),
  ];
}
