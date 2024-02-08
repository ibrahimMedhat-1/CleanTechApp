import 'package:dio/dio.dart';

// import 'package:sentry_flutter/sentry_flutter.dart';

class ResponseValidationInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(
        DioException(
          requestOptions: err.requestOptions,
          error: err.response?.data['data'],
          message: err.response?.data['message'],
        ),
        handler);
  }
}
