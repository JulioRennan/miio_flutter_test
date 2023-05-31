import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../errors/network_errors.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _errorHandler(dioError: err);
    super.onError(err, handler);
  }

  DioError _errorHandler({required DioError dioError}) {
    if (dioError.error is SocketException ||
        DioErrorType.connectionTimeout == dioError.type ||
        DioErrorType.receiveTimeout == dioError.type) {
      throw NetworkNoConnectionError();
    } else {
      if (dioError.response == null) {
        throw NetworkNotAvaiable();
      }
      final response = dioError.response!;
      _showErrorInfo(dioError);
      switch (response.statusCode) {
        case 500:
          throw NetworkInternalServerError();
        default:
          throw NetworkResponseError(
            statusCode: response.statusCode ?? 400,
            data: response.data,
          );
      }
    }
  }

  void _showErrorInfo(DioError dioError) {
    var response = dioError.response!;
    log('error --> ${dioError.error}');
    log('erro na rota --> ${dioError.requestOptions.path}');
    log('resposta servidor [${response.statusCode}] --> ${response.data}');
  }
}
