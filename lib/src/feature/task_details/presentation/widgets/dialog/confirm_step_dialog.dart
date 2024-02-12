import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class ConfirmStepDialog extends StatelessWidget {
  ConfirmStepDialog({super.key});

  final taskDetailsCubit = sl<TaskDetailsCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: taskDetailsCubit,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350.w,
              height: 330.h,
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
                          )),
                      child: Assets.images.logo.image(),
                    ),
                    16.isHeight,
                    Padding(
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                child: BlocBuilder(
                                  bloc: taskDetailsCubit,
                                  builder: (context, state) {
                                    return ButtonWidget(
                                      text: AppStrings.confirmStep.tr(context),
                                      onPressed: () {
                                        taskDetailsCubit.onChangeSteps();
                                        CustomNavigator.instance.pop();
                                      },
                                    );
                                  },
                                ),
                              ),
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
      ),
    );
  }
}
