// import 'package:ct_clean/src/core/config/routes/app_imports.dart';
//
// class AmountAndSerialDialog extends StatelessWidget {
//   AmountAndSerialDialog({
//     super.key,
//     required this.missionType,
//     required this.currentState,
//   });
//
//   final int missionType;
//   final int currentState;
//   final taskDDC = sl<TaskDetailsDevastationCubit>();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: taskDDC,
//       child: BlocConsumer(
//         bloc: taskDDC,
//         listener: (context, state) {
//           if (state is ChangeDevastationStateSuccess) {
//             CustomNavigator.instance.pop();
//           }
//         },
//         builder: (context, state) {
//           var model = taskDDC.detailsMissionModel;
//           return Padding(
//             padding: EdgeInsetsDirectional.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   width: 350.w,
//                   height: MediaQuery.sizeOf(context).height *
//                       (currentState == 0
//                           ? 0.36
//                           : ((missionType == 1 || missionType == 2)
//                               ? 0.52
//                               : 0.47)),
//                   child: Card(
//                     color: AppColors.primary2,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12.r),
//                     ),
//                     child: Column(
//                       children: [
//                         const DialogLogo(),
//                         16.isHeight,
//                         Padding(
//                           padding:
//                               EdgeInsetsDirectional.symmetric(horizontal: 20.w),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               5.isHeight,
//                               currentState == 0
//                                   ? const SizedBox.shrink()
//                                   : Column(
//                                       children: [
//                                         (missionType == 1 || missionType == 2)
//                                             ? TextFieldWidget(
//                                                 hint: AppStrings
//                                                     .containersNumber
//                                                     .tr(context),
//                                                 color: AppColors.white,
//                                                 borderRadius: 8.r,
//                                                 // controller: taskDetailsCubit.noteController,
//                                                 // onChanged: taskDDC.serialNumberOnChange,
//                                               )
//                                             : const SizedBox.shrink(),
//                                         10.isHeight,
//                                         TextFieldWidget(
//                                           hint: AppStrings.receivedAmount
//                                               .tr(context),
//                                           color: AppColors.white,
//                                           borderRadius: 8.r,
//                                           // controller: taskDetailsCubit.noteController,
//                                           // onChanged: taskDDC.amountOnChange,
//                                         ),
//                                         20.isHeight,
//                                       ],
//                                     ),
//                               Text(
//                                 AppStrings.youCanLeaveANoteOrContinueWithoutIt
//                                     .tr(context),
//                                 style: FontStyles.interSize16_400White.copyWith(
//                                     color: AppColors.black,
//                                     fontSize: 18.sp,
//                                     overflow: TextOverflow.ellipsis),
//                               ),
//                               12.isHeight,
//                               TextFieldWidget(
//                                 hint: AppStrings.putANote.tr(context),
//                                 color: AppColors.white,
//                                 borderRadius: 8.r,
//                                 // controller: taskDetailsCubit.noteController,
//                                 // onChanged: taskDDC.commentOnChange,
//                               ),
//                               21.isHeight,
//                               Row(
//                                 children: [
//                                   10.isWight,
//                                   Expanded(
//                                     child: ButtonWidget(
//                                       text: AppStrings.back.tr(context),
//                                       onPressed: () =>
//                                           CustomNavigator.instance.pop(),
//                                     ),
//                                   ),
//                                   10.isWight,
//                                   Expanded(
//                                       child: ButtonWidget(
//                                     text: AppStrings.confirmStep.tr(context),
//                                     color: (model?.missionType == 1 ||
//                                             model?.missionType == 2)
//                                         ? (taskDDC.checkContainerModel?.exist ??
//                                                     false) ==
//                                                 false
//                                             ? AppColors.primary3
//                                             : null
//                                         : null,
//                                     onPressed: () {
//                                       taskDDC.changeMissionState();
//                                     },
//                                   )),
//                                   10.isWight,
//                                 ],
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
