import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  ApiException({required this.message, this.statusCode, this.data});

  factory ApiException.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException(message: 'Connection timeout. Please check your internet connection.', statusCode: null);
      case DioExceptionType.badResponse:
        return ApiException(message: _getMessageFromStatusCode(e.response?.statusCode), statusCode: e.response?.statusCode, data: e.response?.data);
      case DioExceptionType.connectionError:
        return ApiException(message: 'No internet connection. Please check your network.', statusCode: null);
      case DioExceptionType.cancel:
        return ApiException(message: 'Request was cancelled.', statusCode: null);
      case DioExceptionType.badCertificate:
        return ApiException(message: 'Certificate verification failed.', statusCode: null);
      case DioExceptionType.unknown:
        return ApiException(message: 'Something went wrong. Please try again.', statusCode: null);
    }
  }

  static String _getMessageFromStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request. Please try again.';
      case 401:
        return 'Unauthorized. Please login again.';
      case 403:
        return 'Access denied.';
      case 404:
        return 'Resource not found.';
      case 422:
        return 'Invalid data provided.';
      case 500:
        return 'Server error. Please try again later.';
      case 502:
        return 'Bad gateway. Please try again later.';
      case 503:
        return 'Service unavailable. Please try again later.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }

  @override
  String toString() => 'ApiException: $message (statusCode: $statusCode)';
}
