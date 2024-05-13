import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/widgets/cached_image.dart';
import 'package:ct_clean/src/feature/devastation/task_details_devastation/presentation/widgets/dialog/note_dialog.dart';
import 'package:ct_clean/src/feature/devastation/task_details_devastation/presentation/widgets/dialog/sahb_and_tahtel_dialog.dart';
import 'package:ct_clean/src/feature/devastation/task_details_devastation/presentation/widgets/dialog/tanzel_and_tabdel_dialog.dart';

class TaskDetailsDevastationBody extends StatelessWidget {
  TaskDetailsDevastationBody({super.key});

  final taskDDC = sl<TaskDetailsDevastationCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: taskDDC,
      child: BlocConsumer(
        bloc: taskDDC,
        listener: (context, state) {
          if (state is ChangeDevastationStateSuccess) {
            print("The next id is : ${state.r.next}");
            if (state.r.next != 0) {
              taskDDC.getMissionDevastationDetails(state.r.next ?? 0);
            } else {
              taskDDC.getMissionDevastationDetails(taskDDC.detailsMissionModel?.id ?? 0);
            }
            if (state.r.next == null) {
              CustomNavigator.instance.pop();
            }
          }
        },
        builder: (context, state) {
          var item = taskDDC.detailsMissionModel;
          return Column(
            children: [
              SizedBox(
                height: 70.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        BaseText(
                          title: AppStrings.placeName.tr(context),
                          subTitle: item?.company ?? 'Loading...',
                        ),
                        // Assets.images.placeLogo.image()
                      ],
                    ),
                    19.isHeight,
                    BaseText(
                      title: AppStrings.placeAddress.tr(context),
                      subTitle: item?.address ?? 'Loading...',
                    ),
                  ],
                ),
              ),
              19.isHeight,
              Row(
                children: [
                  Text(
                    "${AppStrings.taskDetails.tr(context)} : ",
                    style: FontStyles.interSize18_400Primary.copyWith(
                      fontSize: 18.sp,
                      color: AppColors.primary,
                      // overflow: TextOverflow.clip,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.45,
                    ),
                    child: Text(
                      (item?.description ?? 'Loading...'),
                      maxLines: 3,
                      style: FontStyles.interSize13_400Black.copyWith(
                        fontSize: 16.sp,

                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              10.isHeight,
              Row(
                children: [
                  Assets.svgs.deservedAmount.svg(),
                  Text(
                    AppStrings.deservedAmount.tr(context),
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                    ),
                  ),
                  5.isWidth,
                  Text("${item?.amount ?? 0.0}"),
                ],
              ),
              TextButton(
                  style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      enableDrag: true,
                      showDragHandle: true,
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.sizeOf(context).width,
                        maxHeight: MediaQuery.sizeOf(context).height,
                      ),
                      // isScrollControlled: ,
                      // useRootNavigator: ,
                      // scrollControlDisabledMaxHeightRatio: ,
                      // routeSettings: ,
                      // transitionAnimationController: ,
                      //  useSafeArea: ,
                      // isDismissible: ,

                      builder: (context) {
                        return CachedImage(
                          link: item?.image,
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height,
                          fit: BoxFit.fill,
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Assets.svgs.collectImages.svg(),
                      10.isWidth,
                      Text(AppStrings.viewAttachments.tr(context))
                    ],
                  )),
              20.isHeight,
              DevastationStepsWidget(
                missionId: item?.id ?? 0,
                missionType: item?.missionType ?? 0,
              ),
              70.isHeight,
              DevastationDetailsButtons(
                missionType: item?.missionType ?? 0,
                missionId: item?.id ?? 0,
              ),
            ],
          );
        },
      ),
    );
  }
}

class DevastationDetailsButtons extends StatefulWidget {
  const DevastationDetailsButtons({super.key, required this.missionType, required this.missionId});

  final int missionType;
  final int missionId;

  @override
  State<DevastationDetailsButtons> createState() => _DevastationDetailsButtonsState();
}

class _DevastationDetailsButtonsState extends State<DevastationDetailsButtons> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskDetailsDevastationCubit, TaskDetailsDevastationState>(
      builder: (context, state) {
        var cubit = context.read<TaskDetailsDevastationCubit>();
        var item = cubit.detailsMissionModel;
        return Row(
          children: [
            Expanded(
              flex: 2,
              child: ButtonWidget(
                text: (item?.currentStatus ?? 0) == 0
                    ? AppStrings.theClientHasBeenApproached.tr(context)
                    : item?.currentStatus == 2
                        ? AppStrings.warehouse.tr(context)
                        : getSecondMissionTitle,
                onPressed: () {
                  print(item?.missionType);
                  print((item?.missionType == 0 || item?.missionType == 3));
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) {
                      return (item?.currentStatus == 0) || item?.currentStatus == 2
                          ? NoteDialog()
                          : (item?.missionType == 0 || item?.missionType == 3)
                              ? SehbAndTahtelDialog()
                              : TanzelAndTabdelDialog();
                      // AmountAndSerialDialog(
                      //             missionType: widget.missionType,
                      //             currentState: item?.currentStatus ?? 0);
                    },
                  );
                },
                color: AppColors.primary,
              ),
            ),
            10.isWidth,
            Expanded(
              child: ButtonWidget(
                onPressed: () => showAdaptiveDialog(
                  context: context,
                  builder: (context) => ContactTheAdministrationDialog(),
                ),
                text: "${AppStrings.administration.tr(context)} 📞",
                fontStyle: TextStyle(
                  color: AppColors.white,
                  fontSize: 15.sp,
                  // fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String get getSecondMissionTitle => widget.missionType == 0
      ? AppStrings.pull.tr(context) // تنزيل
      : widget.missionType == 1
          ? AppStrings.rebate.tr(context) //سحب
          : widget.missionType == 2
              ? AppStrings.switchState.tr(context) // تبديل
              : AppStrings.modification.tr(context); // تعديل
}
