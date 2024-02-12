import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  bool isShowPassword = true;

  void changePasswordVisibilityInLogin() {
    isShowPassword = !isShowPassword;
    emit(ShowLoginPassword());
  }
  String language  = "ar";
  void changeLang(String lang){
    language = lang;
    print(language);
    emit(ChangeLangState());
  }
}
