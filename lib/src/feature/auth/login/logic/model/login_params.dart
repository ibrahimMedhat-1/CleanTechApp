class LoginParams {
  final String mobile;
  final String password;
  final int carId;

  LoginParams({this.mobile = '', this.password = '', this.carId = 0});

  Map<String, dynamic> toMap() {
    return {'mobile': mobile, 'password': password, "carId": carId};
  }

  LoginParams copyWith({
    String? mobile,
    String? password,
    int? carId,
  }) {
    return LoginParams(
      mobile: mobile ?? this.mobile,
      password: password ?? this.password,
      carId: carId ?? this.carId,
    );
  }
}
