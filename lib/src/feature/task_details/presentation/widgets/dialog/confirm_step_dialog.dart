import 'package:ct_clean/src/core/config/routes/app_imports.dart';

Position? position;

class ConfirmStepDialog extends StatefulWidget {
  ConfirmStepDialog({
    super.key,
    required this.missionId,
    required this.stepId,
  });

  final int missionId;
  final int stepId;

  @override
  State<ConfirmStepDialog> createState() => _ConfirmStepDialogState();
}

class _ConfirmStepDialogState extends State<ConfirmStepDialog> {
  final taskDetailsCubit = sl<TaskDetailsCubit>();

  final mapCubit = sl<MapCubit>();

  @override
  void initState() {
    super.initState();
    taskDetailsCubit.image = null;

    taskDetailsCubit.getMissionDetails(widget.missionId);
    getLocation();
  }

  void getLocation() {
    LocationHelper.getCurrentLocation().then((value) {
      setState(() {
        position = value;
        print(position?.longitude);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: taskDetailsCubit,
      child: BlocConsumer<TaskDetailsCubit, TaskDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350.w,
                child: Card(
                  color: AppColors.primary2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    children: [
                      if (widget.stepId != 1 && widget.stepId != 2)
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
                      if (widget.stepId == 1 || widget.stepId == 2)
                        InkWell(
                          onTap: () => taskDetailsCubit.getImage(),
                          child: Container(
                            width: double.infinity,
                            height: 300.h,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(12.r),
                                topStart: Radius.circular(12.r),
                              ),
                            ),
                            child: taskDetailsCubit.image != null
                                ? Image.file(taskDetailsCubit.image!, fit: BoxFit.fill)
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Assets.svgs.addImage.svg(
                                        fit: BoxFit.scaleDown,
                                      ),
                                      Text(
                                        AppStrings.addImage.tr(context),
                                        style: FontStyles.interSize16_400White.copyWith(
                                            color: AppColors.black,
                                            fontSize: 18.sp,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.youCanLeaveANoteOrContinueWithoutIt.tr(context),
                              style: FontStyles.interSize16_400White.copyWith(
                                  color: AppColors.black, fontSize: 18.sp, overflow: TextOverflow.ellipsis),
                            ),
                            12.isHeight,
                            TextFieldWidget(
                              hint: AppStrings.putANote.tr(context),
                              color: AppColors.white,
                              borderRadius: 8.r,
                              controller: taskDetailsCubit.noteController,
                              // onChanged: taskDetailsCubit.noteOnChange,
                            ),
                            21.isHeight,
                            Row(
                              children: [
                                10.isWidth,
                                Expanded(
                                  child: ButtonWidget(
                                    text: AppStrings.back.tr(context),
                                    onPressed: () {
                                      taskDetailsCubit.image = null;
                                      CustomNavigator.instance.pop();
                                    },
                                  ),
                                ),
                                10.isWidth,
                                Expanded(
                                  child: BlocBuilder(
                                    bloc: taskDetailsCubit,
                                    builder: (context, state) {
                                      return ButtonWidget(
                                        loading: state is ChangeMissionStateLoading,
                                        text: AppStrings.confirmStep.tr(context),
                                        onPressed: () {
                                          if (taskDetailsCubit.image != null) {
                                            if (position == null) {
                                              getLocation();
                                              // CustomNavigator.instance.pop();
                                              flutterToast(msg: "Try again");
                                            } else {
                                              taskDetailsCubit.changeMissionState(
                                                  missionId: taskDetailsCubit.missionDetailsModel?.id ?? 0,
                                                  lat: position?.latitude ?? 0,
                                                  lng: position?.longitude ?? 0);
                                              taskDetailsCubit.image = null;
                                              print(taskDetailsCubit.missionDetailsModel?.id);
                                              CustomNavigator.instance.pop();
                                            }
                                          } else {
                                            flutterToast(msg: AppStrings.addImage.tr(context));
                                          }
                                        },
                                      );
                                    },
                                  ),
                                ),
                                10.isWidth,
                              ],
                            ),
                            20.isHeight
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
