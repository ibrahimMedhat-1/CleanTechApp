import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/extensions/string_extension.dart';
import 'package:ct_clean/src/core/utils/pop_up.dart';

GlobalKey<FormState> loginKey = GlobalKey<FormState>();

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final loginCubit = sl<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: loginCubit,
      child: BlocConsumer(
        listener: (context, state) {
          if (state is LoginSuccess) {
            CustomNavigator.instance.pushNamedAndRemoveUntil(
              Routes.layoutScreen,
              (route) => false,
            );
          } else if (state is LoginFailure) {
            flutterToast(msg: state.msg);
          }
        },
        bloc: loginCubit,
        builder: (context, state) {
          return Form(
            key: loginKey,
            child: Column(
              children: [
                TextFieldWidget(
                  hint: AppStrings.mobile.tr(context),
                  borderRadius: 8.r,
                  color: AppColors.white,
                  onChanged: loginCubit.mobileOnChange,
                  validator: context.generalValidate,
                  keyboardType: TextInputType.phone,
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
                  onChanged: loginCubit.passwordOnChange,
                  validator: context.generalValidate,
                ),
                25.isHeight,
                LanguageDropDown(
                  label: AppStrings.chooseTheLanguage.tr(context),
                ),
                27.isHeight,
                ButtonWidget(
                  text: AppStrings.login.tr(context),
                  hasElevation: true,
                  borderRadius: 8.r,
                  loading: state is LoginLoading,
                  margin: EdgeInsetsDirectional.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * 0.1),
                  onPressed: () => loginKey.currentState!.validate()
                      ? loginCubit.login()
                      : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
