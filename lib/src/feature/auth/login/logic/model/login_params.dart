class LoginParams {
  final String mobile;
  final String password;

  LoginParams({
      this.mobile='',
      this.password='',
  });


  Map<String, dynamic> toMap() {
    return {
      'mobile': mobile,
      'password': password,
    };
  }

  LoginParams copyWith({
    String? mobile,
    String? password,
  }) {
    return LoginParams(
      mobile: mobile ?? this.mobile,
      password: password ?? this.password,
    );
  }
}
