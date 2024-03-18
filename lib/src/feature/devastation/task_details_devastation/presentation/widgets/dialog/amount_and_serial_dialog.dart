import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class AmountAndSerialDialog extends StatelessWidget {
  AmountAndSerialDialog({
    super.key,
    required this.missionType,
    required this.currentState,
    required this.missionId,
  });

  final int missionType;
  final int missionId;
  final int currentState;
  final taskDDC = sl<TaskDetailsDevastationCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: taskDDC,
      child: BlocConsumer(
        bloc: taskDDC,
        listener: (context, state) {
          if (state is ChangeDevastationStateSuccess) {
            CustomNavigator.instance.pop();
            // taskDDC.getMissionDevastationDetails(missionId);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsetsDirectional.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 350.w,
                  height: MediaQuery.sizeOf(context).height *
                      (currentState == 0
                          ? 0.36
                          : ((missionType == 1 || missionType == 2)
                              ? 0.52
                              : 0.47)),
                  child: Card(
                    color: AppColors.primary2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 91.h,
                          padding: EdgeInsetsDirectional.only(
                            top: 26.h,
                            bottom: 18.h,
                            start: 51.w,
                            end: 45.w,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadiusDirectional.only(
                              topEnd: Radius.circular(12.r),
                              topStart: Radius.circular(12.r),
                            ),
                          ),
                          child: Assets.images.logo.image(fit: BoxFit.cover),
                        ),
                        16.isHeight,
                        Padding(
                          padding:
                              EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              5.isHeight,
                              currentState == 0
                                  ? const SizedBox.shrink()
                                  : Column(
                                      children: [
                                        (missionType == 1 || missionType == 2)
                                            ? TextFieldWidget(
                                                hint: AppStrings
                                                    .containersNumber
                                                    .tr(context),
                                                color: AppColors.white,
                                                borderRadius: 8.r,
                                                // controller: taskDetailsCubit.noteController,
                                                // onChanged: taskDetailsCubit.noteOnChange,
                                              )
                                            : const SizedBox.shrink(),
                                        10.isHeight,
                                        TextFieldWidget(
                                          hint: AppStrings.receivedAmount
                                              .tr(context),
                                          color: AppColors.white,
                                          borderRadius: 8.r,
                                          // controller: taskDetailsCubit.noteController,
                                          // onChanged: taskDetailsCubit.noteOnChange,
                                        ),
                                        20.isHeight,
                                      ],
                                    ),
                              Text(
                                AppStrings.youCanLeaveANoteOrContinueWithoutIt
                                    .tr(context),
                                style: FontStyles.interSize16_400White.copyWith(
                                    color: AppColors.black,
                                    fontSize: 18.sp,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              12.isHeight,
                              TextFieldWidget(
                                hint: AppStrings.putANote.tr(context),
                                color: AppColors.white,
                                borderRadius: 8.r,
                                // controller: taskDetailsCubit.noteController,
                                // onChanged: taskDetailsCubit.noteOnChange,
                              ),
                              21.isHeight,
                              Row(
                                children: [
                                  10.isWight,
                                  Expanded(
                                    child: ButtonWidget(
                                      text: AppStrings.back.tr(context),
                                      onPressed: () =>
                                          CustomNavigator.instance.pop(),
                                    ),
                                  ),
                                  10.isWight,
                                  Expanded(
                                      child: ButtonWidget(
                                    text: AppStrings.confirmStep.tr(context),
                                    onPressed: () {
                                      taskDDC.changeMissionState();
                                    },
                                  )),
                                  10.isWight,
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
