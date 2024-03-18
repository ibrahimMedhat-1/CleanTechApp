import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class NoteDialog extends StatelessWidget {
  NoteDialog({super.key});

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
            taskDDC.params = ChangeDevastationMissionParams();
          }
        },
        builder: (context, state) {
          var model = taskDDC.detailsMissionModel;
          return CustomDialog(
            dialogHeight: MediaQuery.sizeOf(context).height * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                5.isHeight,
                Text(
                  AppStrings.youCanLeaveANoteOrContinueWithoutIt.tr(context),
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
                  onChanged: taskDDC.commentOnChange,
                ),
              ],
            ),
            confirmTap: () {
              taskDDC.changeMissionState();
            },
          );
        },
      ),
    );
  }
}
