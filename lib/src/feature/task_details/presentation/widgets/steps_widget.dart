import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class StepsWidget extends StatelessWidget {
  const StepsWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Stepper(
      currentStep: 3,
        physics: ClampingScrollPhysics(),
      // onStepCancel: () {
      //   // if (_index > 0) {
      //   //   setState(() {
      //   //     _index -= 1;
      //   //   });
      //   // }
      // },
      // onStepContinue: () {
      //   // if (_index <= 0) {
      //   //   setState(() {
      //   //     _index += 1;
      //   //   });
      //   // }
      // },
      // onStepTapped: (int index) {
      //   // setState(() {
      //   //   _index = index;
      //   // });
      // },
      connectorColor: MaterialStateProperty.all(AppColors.primary),

      steps: [
        Step(
          title: Text(AppStrings.theClientHasBeenApproached.tr(context)),
          content: Container(
              // alignment: Alignment.centerLeft,
              // child: const Text('Content for Step 1'),
              ),
        ),
        Step(
          title: Text(AppStrings.haveBeenReached.tr(context)),
          content: SizedBox.shrink(),
        ),
        Step(
          title: Text(AppStrings.beginningOfDischarge.tr(context)),
          content: SizedBox.shrink(),
        ),
        Step(
          title: Text(AppStrings.beenCompleted.tr(context)),
          content: SizedBox.shrink(),
        ),
      ],
    );
  }
}
