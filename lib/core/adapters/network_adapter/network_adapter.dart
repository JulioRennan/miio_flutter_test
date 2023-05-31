import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:miio_flutter_test/core/config/constants.dart';

class NetworkAdapter extends Interceptor {
  static bool hasDialogNoConnection = false;
  final bool debugRequest = true;
  final bool debugReponse = true;

  late final _dio = Dio();
  final String baseUrl;
  NetworkAdapter({
    this.baseUrl = Constants.baseUrl,
  }) {
    var options = BaseOptions(baseUrl: baseUrl);
    _dio.options = options;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (debugRequest) showRequestInfo(options);
          return handler.next(options);
        },
        onResponse: (options, handler) {
          if (debugReponse) showResponseInfo(options);
          return handler.next(options);
        },
        onError: (DioError dioError,
            ErrorInterceptorHandler errorInterceptorHandler) async {
          errorHandler(dioError: dioError);
          return errorInterceptorHandler.next(dioError);
        },
      ),
    );
  }

  DioError errorHandler({
    required DioError dioError,
    bool connectionError = false,
  }) {
    if (dioError.error is SocketException ||
        DioErrorType.connectionTimeout == dioError.type ||
        DioErrorType.receiveTimeout == dioError.type) {
      if (!hasDialogNoConnection) {
        hasDialogNoConnection = true;
      }
      return dioError;
    } else {
      var response = dioError.response;
      log('error --> ${dioError.error}');
      log('erro na rota --> ${dioError.requestOptions.path}');
      log('resposta servidor [${response?.statusCode}] --> ${response?.data}');

      switch (response?.statusCode) {
        case 404:
        case 409:
        case 401:
          return dioError;
        default:
          return dioError;
      }
    }
  }

  //mostra informações básicas sobre a request, se o modo debugRequest == true
  void showRequestInfo(RequestOptions options) {
    log("Request[${options.method}]: ${options.path}");
    log("query params: ${options.queryParameters}");
    log("body: ${options.data}");
    log("\n");
  }

  //mostra informações básicas sobre a request, se o modo debugResponse == true
  void showResponseInfo(options) {
    log("Response status code [${options.statusCode}]");
    log("body : \n${options.data}\n");
    log("\n");
  }

  Future<dynamic> get(
    String url, {
    bool withToken = true,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
  }) async {
    var response = await _dio.get(
      url,
      queryParameters: query,
      options: Options(headers: headers),
    );
    return response.data;
  }

  Future<dynamic> post(
    String url,
    Map<String, dynamic> body, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? pathFiles,
    Map<String, dynamic>? byteFiles,
    bool withToken = true,
  }) async {
    dynamic data = body;
    if (byteFiles != null) {
      for (var key in byteFiles.keys) {
        final bytes = byteFiles[key];
        if (bytes is List<Uint8List>) {
          final multiPartFiles = [];
          for (var b in bytes) {
            final file = MultipartFile.fromBytes(
              b,
              filename: key,
            );
            multiPartFiles.add(
              file,
            );
          }
          body[key] = multiPartFiles;
        } else {
          body[key] = MultipartFile.fromBytes(
            bytes!,
            filename: key,
          );
        }
      }
    }
    if (pathFiles != null) {
      for (var key in pathFiles.keys) {
        final path = pathFiles[key];
        if (path is List) {
          final multiPartFiles = [];
          for (var p in path) {
            final file = await MultipartFile.fromFile(p);
            multiPartFiles.add(file);
          }
          body[key] = multiPartFiles;
        } else {
          body[key] = await MultipartFile.fromFile(path);
        }
      }
    }

    if (pathFiles != null || byteFiles != null) {
      data = FormData.fromMap(body);
    }
    var response = await _dio.post(
      url,
      data: data,
      options: Options(
        headers: headers,
      ),
    );
    return response.data;
  }

  Future<dynamic> put(
    String url,
    Map<String, dynamic> body, {
    Map<String, dynamic>? headers,
    bool withToken = true,
  }) async {
    var response = await _dio.put(
      url,
      data: body,
      options: Options(
        headers: headers,
      ),
    );
    return response.data;
  }

  //
  Future<dynamic> patch(
    url,
    body, {
    Map<String, dynamic>? headers,
    bool withToken = true,
    Map<String, dynamic>? pathFiles,
    Map<String, dynamic>? byteFiles,
  }) async {
    dynamic data = body;
    if (byteFiles != null) {
      for (var key in byteFiles.keys) {
        final bytes = byteFiles[key];
        if (bytes is List<Uint8List>) {
          final multiPartFiles = [];
          for (var b in bytes) {
            final file = MultipartFile.fromBytes(
              b,
              filename: key,
            );
            multiPartFiles.add(
              file,
            );
          }
          body[key] = multiPartFiles;
        } else {
          body[key] = MultipartFile.fromBytes(
            bytes!,
            filename: key,
          );
        }
      }
    }
    if (pathFiles != null) {
      for (var key in pathFiles.keys) {
        final path = pathFiles[key];
        body[key] = await MultipartFile.fromFile(path);
      }
    }
    if (pathFiles != null || byteFiles != null) {
      data = FormData.fromMap(body);
    }
    var response = await _dio.patch(
      url,
      data: data,
      options: Options(headers: headers),
    );
    return response.data;
  }

  Future<dynamic> delete(
    url, {
    Map<String, dynamic>? headers,
    bool withToken = true,
  }) async {
    var response = await _dio.delete(
      url,
      options: Options(headers: headers),
    );
    return response.data;
  }
}
