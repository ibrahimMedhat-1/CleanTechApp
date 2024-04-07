import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:flutter/services.dart';

GlobalKey<FormState> tanzelAndTabdelKey = GlobalKey<FormState>();

class TanzelAndTabdelDialog extends StatelessWidget {
  final taskDDC = sl<TaskDetailsDevastationCubit>();

  TanzelAndTabdelDialog({super.key});

  TextEditingController serialController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: taskDDC,
      child: BlocConsumer(
        bloc: taskDDC,
        listener: (context, state) {
          if (state is ChangeDevastationStateSuccess) {
            CustomNavigator.instance.pop();
            taskDDC.params = ChangeDevastationMissionParams();
          }
          if (state is CheckContainerSuccess) {
            if (state.exit == false) {
              flutterToast(
                  msg: AppStrings.pleaseEnterAValidContainerNumber.tr(context));
            }
          }
        },
        builder: (context, state) {
          var model = taskDDC.detailsMissionModel;
          return CustomDialog(
            dialogHeight: MediaQuery.sizeOf(context).height * 0.52,
            child: Form(
              key: tanzelAndTabdelKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.isHeight,
                  TextFieldWidget(
                    hint: AppStrings.containersNumber.tr(context),
                    color: AppColors.white,
                    borderRadius: 8.r,
                    // controller: serialController,
                    onChanged: (value) {
                      taskDDC.serialNumberOnChange(value);
                      taskDDC.checkContainer(value);
                    },
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return AppStrings.pleaseEnterTheContainerNumber
                            .tr(context);
                      }
                      return null;
                    },
                  ),
                  10.isHeight,
                  TextFieldWidget(
                    hint: AppStrings.receivedAmount.tr(context),
                    color: AppColors.white,
                    borderRadius: 8.r,
                    onChanged: taskDDC.amountOnChange,
                  ),
                  10.isHeight,
                  Text(
                    AppStrings.youCanLeaveANoteOrContinueWithoutIt.tr(context),
                    style: FontStyles.interSize16_400White.copyWith(
                        color: AppColors.black,
                        fontSize: 18.sp,
                        overflow: TextOverflow.ellipsis),
                  ),
                  10.isHeight,
                  TextFieldWidget(
                    hint: AppStrings.putANote.tr(context),
                    color: AppColors.white,
                    borderRadius: 8.r,
                    onChanged: taskDDC.commentOnChange,
                  ),
                ],
              ),
            ),
            confirmTap: () {
              if (tanzelAndTabdelKey.currentState!.validate()) {
                if ((taskDDC.checkContainerModel?.exist ?? false) == false) {
                  flutterToast(
                      msg: AppStrings.pleaseEnterAValidContainerNumber
                          .tr(context));
                } else {
                  if (taskDDC.checkContainerModel?.available == false) {
                    flutterToast(
                        msg: AppStrings
                            .theContainerNumberIsAlreadyRegisteredWithAnotherCustomer
                            .tr(context));
                  } else {
                    taskDDC.changeMissionState();
                  }
                }
              }
            },
          );
        },
      ),
    );
  }
}
