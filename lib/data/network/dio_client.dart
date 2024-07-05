import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// 外部APIへのHTTPリクエストを実行
class DioClient {
  final _dio = Dio(BaseOptions(baseUrl: 'https://api.github.com/'));

  Future<Response<dynamic>> fetch(Map<String, dynamic>? requestParam) async {
    try {
      return await _dio.get(
        'search/repositories',
        queryParameters: requestParam,
      );
    } catch (e) {
      debugPrint('DioClient: ERROR!!!! >>> $e');
      rethrow;
    }
  }
}
