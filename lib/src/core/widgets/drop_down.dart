import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class Dropdown<T> extends StatelessWidget {
  const Dropdown(
      {super.key,
      required this.items,
      required this.onChanged,
      required this.itemToString,
      this.prefix,
      this.hint,
      this.validator,
      this.value,
      this.label,
      this.labelStyle,
      this.padding,
      this.loading = false,
      this.icon,
      this.dropColor,
      this.radius = 7,
      this.borderSideColor,
      this.hintStyle,
      this.onTap,
      this.itemsColor});

  final List<T> items;
  final void Function(T? value) onChanged;
  final String Function(T value) itemToString;
  final Widget? prefix;
  final String? hint;
  final String? label;
  final String? Function(T?)? validator;
  final T? value;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? padding;
  final bool loading;
  final Widget? icon;
  final Color? dropColor;
  final double radius;
  final Color? borderSideColor;
  final Color? itemsColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              label!,
              // style: labelStyle ??
              //     FontStyles.styleBold16.copyWith(
              //       color: AppColors.black,
              //       fontWeight: FontWeight.w600,
              //     ),
            ),
          ),
        DropdownButtonFormField(
          items: items.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(
                itemToString(e),
                style: TextStyle(
                  color: itemsColor ?? AppColors.white,
                ),
              ),
            );
          }).toList(),
          validator: validator,
          onChanged: onChanged,
          onTap: onTap,

          value: value,
          isDense: true,
          dropdownColor: dropColor ?? AppColors.primary,
          decoration: InputDecoration(
            contentPadding: padding ??
                EdgeInsetsDirectional.only(
                  start: 8.w,
                  end: 5.w,
                  top: 10.h,
                  bottom: 10.h,
                ),
            hintText: hint,
            hintStyle: hintStyle ?? Theme.of(context).textTheme.bodyMedium,
            prefixIcon: prefix != null
                ? Padding(
                    padding: const EdgeInsets.all(8),
                    child: prefix!,
                  )
                : null,
            border: mainBorder(radius, color: borderSideColor),
            enabledBorder: mainBorder(radius, color: borderSideColor),
            focusedBorder: mainBorder(radius, color: borderSideColor),
            disabledBorder: mainBorder(radius, color: borderSideColor),
            filled: true,
            isDense: true,
            fillColor: dropColor ?? AppColors.primary,
          ),
          borderRadius: BorderRadius.circular(12),
          isExpanded: true,
          icon: loading
              ? SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                    backgroundColor: Colors.grey,
                  ),
                )
              : icon ??
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.black,
                  ),
        ),
      ],
    );
  }

  OutlineInputBorder mainBorder(double radius, {Color? color}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(color: color ?? AppColors.noColor),
      );
}

class MainDropdown<T> extends StatelessWidget {
  const MainDropdown({
    super.key,
    required this.list,
    this.value,
  });

  final T? value;
  final List<T> list;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: value,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (value) {},
      items: list
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(''),
              ))
          .toList(),
      // list.map<DropdownMenuItem<String>>((String value) {
      //   return DropdownMenuItem<String>(
      //     value: value,
      //     child: Text(value),
      //   );
      // }).toList(),
    );
  }
}
