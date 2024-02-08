// import 'package:spinner/src/core/config/routes/app_imports.dart';
//
// class CustomDropDownWhite<A> extends StatelessWidget {
//   const CustomDropDownWhite(
//       {super.key,
//       required this.hint,
//       required this.items,
//       required this.onChanged,
//       this.validator,
//       this.itemToString,
//       this.label});
//
//   final String hint;
//
//   final List<A> items;
//   final void Function(A? value) onChanged;
//   final String? Function(A?)? validator;
//   final String? label;
//   final String Function(A)? itemToString;
//
//    @override
//   Widget build(BuildContext context) {
//     return Dropdown(
//       itemToString: itemToString ?? (value) => value as String,
//       dropColor: AppColors.white,
//       label: label,
//       borderSideColor: AppColors.spinnerBlack,
//       hintStyle:  Theme.of(context).textTheme.bodyMedium
//           ?.copyWith(color: AppColors.spinnerBlack),
//       itemsColor: AppColors.spinnerBlack,
//       icon: Icon(Icons.arrow_drop_down,
//           color: AppColors.spinnerBlack, size: 25.sp),
//       padding: EdgeInsetsDirectional.only(
//           start: 20.w, end: 5.w, top: 13.h, bottom: 13.h),
//       hint: hint,
//       items: items,
//       onChanged: onChanged,
//       validator: validator,
//     );
//   }
// }
