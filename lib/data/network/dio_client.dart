import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// 外部APIへのHTTPリクエストを実行
class DioClient {
  static const timeoutDuration = Duration(seconds: 15);
  final Dio _dio;

  DioClient({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: 'https://api.github.com/',
                connectTimeout: timeoutDuration,
                receiveTimeout: timeoutDuration,
              ),
            );

  Future<Response<dynamic>> fetch(
    String path,
    Map<String, dynamic>? requestParam,
  ) async {
    try {
      return await _dio.get(
        path,
        queryParameters: requestParam,
      );
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionError:
          debugPrint('DioClient: DioException >>> ${e.message}');
          rethrow;
        case DioExceptionType.connectionTimeout:
          debugPrint('DioClient: DioException >>> ${e.message}');
          rethrow;
        case DioExceptionType.sendTimeout:
          debugPrint('DioClient: DioException >>> ${e.message}');
          rethrow;
        case DioExceptionType.receiveTimeout:
          debugPrint('DioClient: DioException >>> ${e.message}');
          rethrow;
        case DioExceptionType.badResponse:
          debugPrint('DioClient: DioException >>> ${e.message}');
          debugPrint('${e.response!.statusMessage}');
          rethrow;
        case DioExceptionType.cancel:
          debugPrint('DioClient: DioException >>> ${e.message}');
          rethrow;
        case DioExceptionType.badCertificate:
          debugPrint('DioClient: DioException >>> ${e.message}');
          rethrow;
        case DioExceptionType.unknown:
          debugPrint('DioClient: DioException >>> ${e.message}');
          rethrow;
      }
    } catch (e) {
      debugPrint('DioClient: $e');
      rethrow;
    }
  }
}
