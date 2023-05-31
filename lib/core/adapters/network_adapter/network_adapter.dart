import 'package:dio/dio.dart';
import 'package:miio_flutter_test/core/config/constants.dart';

import 'interceptors/error_interceptor.dart';

class NetworkAdapter extends Interceptor {
  late final _dio = Dio();
  final String baseUrl;

  NetworkAdapter({
    this.baseUrl = Constants.baseUrl,
  }) {
    var options = BaseOptions(baseUrl: baseUrl);
    _dio.options = options;
    _dio.interceptors.addAll([
      LogInterceptor(),
      ErrorInterceptor(),
    ]);
  }

  Future<dynamic> get(
    String url, {
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
}
