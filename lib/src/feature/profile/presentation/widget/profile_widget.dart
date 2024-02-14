import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/extensions/string_extension.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = context.read<ProfileCubit>();
        return Row(
          children: [
            SizedBox(
              width: 104.w,
              height: 103.h,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(50.r)),
                  clipBehavior: Clip.antiAlias,
                  child: cubit.profileModel == null
                      ? Icon(
                          Icons.person,
                          size: 60.sp,
                        )
                      : cubit.profileModel?.image == null
                          ? Icon(
                              Icons.person,
                              size: 60.sp,
                            )
                          : Image.network(
                              cubit.profileModel?.image ?? '',
                              fit: BoxFit.cover,
                            )),
            ),
            10.isWight,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // AppStrings.userName.tr(context),
                  cubit.profileModel?.name ?? ''.loadingString,
                  style: FontStyles.interSize18_500Black,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "${AppStrings.carType.tr(context)} ",
                        style: FontStyles.interSize18_400Primary,
                      ),
                      TextSpan(
                        text: cubit.profileModel?.car ?? '███▒▒▒ 70…',
                        // "النوع المستخدم لليوم",
                        style: FontStyles.interSize13_400Black,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
