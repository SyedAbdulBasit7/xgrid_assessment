import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.unknown:
        message = "Connection to API server failed due to internet connection";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioError.response?.statusCode ?? 0,
          dioError.response?.data,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong ${dioError.response?.statusCode}";
        break;
    }
  }

  String? message;

  String? _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request 400';
      case 401:
        return 'UnauthorisedRequest 401';
      case 403:
        return 'UnauthorisedRequest 403';
      case 404:
        return 'Not found 404';
      case 409:
        return 'Conflict error 409';
      case 408:
        return 'Request timeout error 408';
      case 500:
        return 'Internal server error 500';
      case 503:
        return 'Service Unavailable 503';
      default:
        return 'Oops something went wrong $statusCode';
    }
  }

  @override
  String toString() => message ?? '';
}
