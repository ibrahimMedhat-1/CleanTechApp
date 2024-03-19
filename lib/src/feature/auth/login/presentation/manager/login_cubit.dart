import 'package:bloc/bloc.dart';
import 'package:ct_clean/main.dart';
import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:dartz/dartz.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());

  LoginRepo loginRepo;
  LoginParams params = LoginParams();
  int? generalDriverId;

  void login() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final box = GetStorage();
    emit(LoginLoading());
    Either<Failures, LoginModel> result = await loginRepo.login(params);
    result.fold((l) {
      emit(LoginFailure(msg: l.errMessage));
    }, (r) {
      mainDriverId = r.id;
      generalDriverId = r.id;
      print("The generalDriverId is in login Cubit ${generalDriverId}& mainDriverId ${mainDriverId}");
      box.write(MyCashKey.driverId.name, r.id);
      CacheHelper.saveData(key: MyCashKey.driverId, value: r.id);
      prefs.setInt(MyCashKey.driverId.name, r.id ?? -1);
      CacheHelper.saveData(key: MyCashKey.driverName, value: r.name);
      CacheHelper.saveData(key: MyCashKey.image, value: r.image);
      CacheHelper.saveData(key: MyCashKey.type, value: r.type);
      print(UserLocal.driverId);
      emit(LoginSuccess(loginModel: r));
    });
  }

  void mobileOnChange(String? val) {
    params = params.copyWith(mobile: val);
  }

  void passwordOnChange(String? val) {
    params = params.copyWith(password: val);
  }

  int? carId;

  void carOnChange(SearchFieldListItem<CarModel> value) {
    carId = value.item?.id;
    params = params.copyWith(carId: value.item?.id);
  }

  bool isShowPassword = true;

  void changePasswordVisibilityInLogin() {
    isShowPassword = !isShowPassword;
    emit(ShowLoginPassword());
  }

  String language = "ar";

  void changeLang(String lang) {
    language = lang;
    CacheHelper.saveData(key: MyCashKey.lang, value: language);
    print(UserLocal.lang);
    emit(ChangeLangState());
  }

  List<CarModel>? listCars;

  void getCars(String plate) async {
    emit(GetCarsLoading());
    final result = await loginRepo.getCars(plate);
    result.fold((l) {
      print(l.errMessage);
      emit(GetCarsFailure());
    }, (r) {
      listCars = r;
      emit(GetCarsSuccess());
    });
  }
}
