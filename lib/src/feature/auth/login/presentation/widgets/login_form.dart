import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/config/routes/app_router.dart';
import 'package:ct_clean/src/core/config/routes/navigation.dart';
import 'package:ct_clean/src/feature/auth/login/presentation/manager/login_cubit.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final loginCubit = sl<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: loginCubit,
        child: BlocBuilder(
          bloc: loginCubit,
          builder: (context, state) {
            return Column(
              children: [
                TextFieldWidget(
                  hint: AppStrings.mobile.tr(context),
                  borderRadius: 8.r,
                  color: AppColors.white,
                ),
                25.isHeight,
                TextFieldWidget(
                  hint: AppStrings.password.tr(context),
                  isPassword: loginCubit.isShowPassword,
                  trailingIcon: VisibilityPassword(
                      pass: loginCubit.isShowPassword,
                      onPress: () =>
                          loginCubit.changePasswordVisibilityInLogin()),
                  borderRadius: 8.r,
                  color: AppColors.white,
                ),
                27.isHeight,
                ButtonWidget(
                  text: AppStrings.login.tr(context),
                  hasElevation: true,
                  borderRadius: 8.r,
                  margin: EdgeInsetsDirectional.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * 0.1),
                  onPressed: () =>
                      CustomNavigator.instance.pushNamedAndRemoveUntil(Routes.layoutScreen,(route) => false),
                ),
              ],
            );
          },
        ));
  }
}
