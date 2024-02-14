import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 13.w),
      child: Column(
        children: [
          29.isHeight,
          Row(
            children: [
              Container(
                height: 64.h,
                width: 66.w,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
                child: Icon(
                  Icons.person,
                  size: 50.sp,
                ),
              ),
              10.isWight,
              Column(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${AppStrings.welcome.tr(context)} ",
                          style: FontStyles.interSize20_700Primary,
                        ),
                        TextSpan(
                          text: "Ahmed Fayez",
                          style: FontStyles.interSize18_500Black,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    AppStrings.todayItinerary.tr(context),
                    style: FontStyles.interSize18_400Primary,
                  )
                ],
              ),
              Spacer(),
              LanguageDropDown(isExpanded: false),
            ],
          ),
          33.isHeight,
          SizedBox(
            height: 55.h,
            width: 398.w,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 10.h,
                  bottom: 10.h,
                  start: 20.w,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 30.h,
                      width: 30.w,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(0)),
                        color: AppColors.primary,
                      ),
                    ),
                    5.isWight,
                    Text(AppStrings.ordinaryTask.tr(context)),
                    30.isWight,
                    SizedBox(
                      height: 30.h,
                      width: 30.w,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(0)),
                        color: AppColors.red,
                      ),
                    ),
                    5.isWight,
                    Text(AppStrings.urgentTask.tr(context)),
                  ],
                ),
              ),
            ),
          ),
          const TasksList(),
          20.isHeight
        ],
      ),
    );
  }
}
