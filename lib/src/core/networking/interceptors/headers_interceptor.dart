import 'package:dio/dio.dart';

class HeadersInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accept"] = "Application/json";

    // options.baseUrl = dotenv.env["BASE_URL"] ?? "";

    if (!options.headers.containsKey('Authorization')) {
      // options.headers['Authorization'] = "Bearer ${loggedInUser.token}";
    }

    // options.headers.addAll({
    // "Accept-Language": LocalizationUtils.locale,
    // });
    super.onRequest(options, handler);
  }
}
