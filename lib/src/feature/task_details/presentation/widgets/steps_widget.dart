import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class StepsWidget extends StatelessWidget {
  StepsWidget({
    super.key,
    this.currentIndex = 0,
    this.onTap,
  });

  int currentIndex;
  void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        StepsDataModel.listSteps(context).length,
        (index) => InkWell(
          onTap: onTap == null ? null : () => onTap!(index),
          child: buildOneStep(
            title: StepsDataModel.listSteps(context)[index].title,
            index: index,
            image: StepsDataModel.listSteps(context)[index].image,
            currentIndex: currentIndex,
          ),
        ),
      ),
    );

    //
    //   Stepper(
    //   currentStep: 3,
    //     physics: ClampingScrollPhysics(),
    //   // onStepCancel: () {
    //   //   // if (_index > 0) {
    //   //   //   setState(() {
    //   //   //     _index -= 1;
    //   //   //   });
    //   //   // }
    //   // },
    //   // onStepContinue: () {
    //   //   // if (_index <= 0) {
    //   //   //   setState(() {
    //   //   //     _index += 1;
    //   //   //   });
    //   //   // }
    //   // },
    //   // onStepTapped: (int index) {
    //   //   // setState(() {
    //   //   //   _index = index;
    //   //   // });
    //   // },
    //   connectorColor: MaterialStateProperty.all(AppColors.primary),
    //
    //   steps: [
    //     Step(
    //       title: Text(AppStrings.theClientHasBeenApproached.tr(context)),
    //       content: Container(
    //           // alignment: Alignment.centerLeft,
    //           // child: const Text('Content for Step 1'),
    //           ),
    //     ),
    //     Step(
    //       title: Text(AppStrings.haveBeenReached.tr(context)),
    //       content: SizedBox.shrink(),
    //     ),
    //     Step(
    //       title: Text(AppStrings.beginningOfDischarge.tr(context)),
    //       content: SizedBox.shrink(),
    //     ),
    //     Step(
    //       title: Text(AppStrings.beenCompleted.tr(context)),
    //       content: SizedBox.shrink(),
    //     ),
    //   ],
    // );
    //
    //
  }

  Widget buildOneStep({
    required String title,
    Widget? image,
    required int index,
    int currentIndex = 0,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.gray1)),
              child: currentIndex >= index ? image : null,
            ),
            10.isWight,
            Text(title),
          ],
        ),
        4.isHeight,
        Container(
          height: 50.h,
          width: 2.w,
          margin: EdgeInsetsDirectional.only(start: 20.w),
          decoration: BoxDecoration(
              color: AppColors.gray1, borderRadius: BorderRadius.circular(8.r)),
        ),
        4.isHeight,
      ],
    );
  }
}
