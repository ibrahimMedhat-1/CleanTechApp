import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          50.isHeight,
          Text(
            AppStrings.contactTheAdministration.tr(context),
            style: FontStyles.interSize20_700Primary.copyWith(fontSize: 22.sp),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 20.w),
            child: Text(
              AppStrings.inCaseThereIsAProblemOrInquiry.tr(context),
              style: FontStyles.interSize20_700Primary
                  .copyWith(color: AppColors.primary3),
            ),
          ),
          Assets.images.question.image(),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.15),
            child: ButtonWidget(
              borderRadius: 8.r,
              text: AppStrings.contactTheAdministration.tr(context),
              onPressed: () => showAdaptiveDialog(
                context: context,
                builder: (context) => ContactTheAdministrationDialog(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
