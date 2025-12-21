import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../constants/api_constants.dart';
import 'api_exception.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        sendTimeout: ApiConstants.sendTimeout,
        headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
      ),
    );

    _setupInterceptors();
  }

  void _setupInterceptors() {
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(request: true, requestHeader: true, requestBody: true, responseHeader: false, responseBody: true, error: true, logPrint: (object) => debugPrint(object.toString())),
      );
    }

    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          handler.next(error);
        },
      ),
    );
  }

  // GET request
  Future<Response<T>> get<T>(String path, {Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken}) async {
    try {
      return await _dio.get<T>(path, queryParameters: queryParameters, options: options, cancelToken: cancelToken);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  // POST request
  Future<Response<T>> post<T>(String path, {dynamic data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken}) async {
    try {
      return await _dio.post<T>(path, data: data, queryParameters: queryParameters, options: options, cancelToken: cancelToken);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  // PUT request
  Future<Response<T>> put<T>(String path, {dynamic data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken}) async {
    try {
      return await _dio.put<T>(path, data: data, queryParameters: queryParameters, options: options, cancelToken: cancelToken);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  // DELETE request
  Future<Response<T>> delete<T>(String path, {dynamic data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken}) async {
    try {
      return await _dio.delete<T>(path, data: data, queryParameters: queryParameters, options: options, cancelToken: cancelToken);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
