import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:miio_flutter_test/core/config/constants.dart';

class LogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (Constants.debugRequest) _showRequestInfo(options);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (Constants.debugRequest) _showResponseInfo(response);
    super.onResponse(response, handler);
  }

  void _showResponseInfo(options) {
    log("Response status code [${options.statusCode}]");
    log("body : \n${options.data}\n");
    log("\n");
  }

  void _showRequestInfo(RequestOptions options) {
    log("Request[${options.method}]: ${options.path}");
    log("query params: ${options.queryParameters}");
    log("body: ${options.data}");
    log("\n");
  }
}
