import 'dart:developer';

import 'package:ct_clean/src/core/config/routes/app_imports.dart';


class ApiService {
  final Dio _authDio;
  ApiService(this._authDio);

  Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Object data,
  }) async {
    _authDio.options.baseUrl = Constant.baseUrl;
    _authDio.options.receiveDataWhenStatusError = true;
    _authDio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${UserLocal.token}',
    };
    Response response = await _authDio
        .post(
      url,
      queryParameters: query ?? {},
      data: data,
    )
        .catchError((onError) {
      log('Post Erorr:: ${onError.toString()}');
      throw ServerFailure.fromDioError(onError);
    });
    // log('Post Response:: ${response.data}');
    return response;
  }

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    // log('token is $token');
    _authDio.options.baseUrl = Constant.baseUrl;
    _authDio.options.receiveDataWhenStatusError = true;
    _authDio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${UserLocal.token}',
    };
    Response response = await _authDio
        .get(
      url,
      queryParameters: query ?? {},
    )
        .catchError((onError) {
      log('get onError response :: ${onError.toString()}');
      throw ServerFailure.fromDioError(onError);
    });
    // log('get response :: ${response.data}');
    return response;
  }

  Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    _authDio.options.baseUrl = Constant.baseUrl;
    _authDio.options.receiveDataWhenStatusError = true;
    _authDio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${UserLocal.token}',
    };

    Response response = await _authDio
        .put(
      url,
      queryParameters: query,
      data: data,
    )
        .catchError((onError) {
      // log('put response:: ${onError.toString()}');
      throw ServerFailure.fromDioError(onError);
    });
    // log('put response:: ${response.data}');
    return response;
  }

  Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    _authDio.options.baseUrl = Constant.baseUrl;
    _authDio.options.receiveDataWhenStatusError = true;
    _authDio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${UserLocal.token}',
    };

    Response response = await _authDio
        .delete(
      url,
      queryParameters: query,
      data: data,
    )
        .catchError((onError) {
      // log('eslam:: ${onError.toString()}');
      throw ServerFailure.fromDioError(onError);
    });
    // log('delete response:: ${response.data}');
    return response;
  }
}
