
import 'package:ct_clean/src/core/config/routes/app_imports.dart';

void customBottomSheet(BuildContext context, {required Widget widget}) =>
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      showDragHandle: true,
      backgroundColor: AppColors.white,
      builder: (context) =>
          Padding(padding: MediaQuery.of(context).viewInsets, child: widget),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
    );
