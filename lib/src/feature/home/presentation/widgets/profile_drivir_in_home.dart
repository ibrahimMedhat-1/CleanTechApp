import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class ProfileDriverInHome extends StatelessWidget {
  const ProfileDriverInHome({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
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
                offset: const Offset(0, 1),
              ),
            ],
            shape: BoxShape.circle,
            color: AppColors.white,
          ),
          child:
          UserLocal.image == null ?
          Icon(
            Icons.person,
            size: 50.sp,
          ) : ClipRRect(
           borderRadius: BorderRadius.circular(50.r),
            child: Image.network(
              UserLocal.image ?? '',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.person,
                  size: 50.sp,
                );

              },
            ),
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
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: UserLocal.driverName ?? '',
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
            Text(
              AppStrings.todayItinerary.tr(context),
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        // Spacer(),
        // LanguageDropDown(isExpanded: false),
      ],
    );
  }
}
