import 'package:dio/dio.dart';
import 'package:miio_flutter_test/core/config/constants.dart';

import 'handlers/error_handler.dart';

class NetworkAdapter extends Interceptor {
  late final _dio = Dio();
  final String baseUrl;

  NetworkAdapter({
    this.baseUrl = Constants.baseUrl,
  }) {
    var options = BaseOptions(
      baseUrl: baseUrl,
    );
    _dio.options = options;
    _dio.interceptors.addAll([
      LogInterceptor(),
    ]);
  }

  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
  }) async {
    try {
      var response = await _dio.get(
        url,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioError catch (e) {
      ErrorHandler.call(e);
    }
  }
}
