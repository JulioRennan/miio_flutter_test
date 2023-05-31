import 'package:miio_flutter_test/domain/errors/failure.dart';

abstract class NetworkError extends Failure {}

class NetworkNoConnectionError extends NetworkError {}

class NetworkInternalServerError extends NetworkError {}

class NetworkNotAvaiable extends NetworkError {}

class NetworkResponseError extends NetworkError {
  NetworkResponseError({
    required this.statusCode,
    required this.data,
  });
  final int statusCode;
  final dynamic data;
}
