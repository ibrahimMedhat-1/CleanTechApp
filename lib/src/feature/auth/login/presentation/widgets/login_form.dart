import 'package:ct_clean/src/core/config/routes/app_imports.dart';

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
            CacheHelper.saveData(
                key: MyCashKey.driverId, value: state.loginModel.id);
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
            child: Expanded(
              child: ListView(
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
                      label: AppStrings.chooseTheLanguage.tr(context)),
                  25.isHeight, //chooseTheCar
                  SearchField<CarModel>(
                    hint: AppStrings.chooseTheCar.tr(context),
                    scrollbarDecoration: ScrollbarDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(12.r),
                      ),
                    ),
                    searchInputDecoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    // suggestionStyle: context.bodySmall,
                    suggestions: loginCubit.listCars
                            ?.map((e) => SearchFieldListItem<CarModel>(
                                "${e.plate}" ?? 'Loading',
                                item: e,
                                child: Text("${e.plate}")))
                            .toList() ??
                        [],
                    itemHeight: 50.h,
                    onSuggestionTap: loginCubit.carOnChange,
                    onSearchTextChanged: (p0) {
                      loginCubit.getCars(p0);
                      return null;
                    },
                    maxSuggestionsInViewPort: 6,
                    suggestionsDecoration: SuggestionDecoration(
                      color: AppColors.primary3,
                      borderRadius: BorderRadiusDirectional.circular(10.r),
                    ),
                  ),

                  27.isHeight,
                  ButtonWidget(
                      text: AppStrings.login.tr(context),
                      hasElevation: true,
                      borderRadius: 8.r,
                      loading: state is LoginLoading,
                      margin: EdgeInsetsDirectional.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width * 0.1),
                      onPressed: () {
                        if (loginKey.currentState!.validate()) {
                          if (loginCubit.carId == null) {
                            flutterToast(
                                msg: AppStrings.pleaseSelectACar.tr(context));
                          } else {
                            loginCubit.login();
                          }
                        }
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
