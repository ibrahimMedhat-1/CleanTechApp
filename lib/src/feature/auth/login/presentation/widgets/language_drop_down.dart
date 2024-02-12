import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class LanguageDropDown extends StatelessWidget {
  const LanguageDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.chooseTheLanguage.tr(context)),
            10.isHeight,
            Card(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(8.r),
                side: BorderSide(color: AppColors.primary)
              ),
              child: DropdownButton(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                items: [
                  AppStrings.arabic.tr(context),
                  AppStrings.english.tr(context)
                ]
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                value: context.read<LoginCubit>().language == 'ar'
                    ? AppStrings.arabic.tr(context)
                    : AppStrings.english.tr(context),
                isExpanded: true,
                underline: SizedBox.shrink(),
                borderRadius: BorderRadius.circular(12),
                onChanged: (value) {
                  if (value == AppStrings.arabic.tr(context)) {
                    context.read<LoginCubit>().changeLang("ar");
                  } else {
                    context.read<LoginCubit>().changeLang("en");
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
