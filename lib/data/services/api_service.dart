import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_codecheck/data/network/dio_client.dart';
import 'package:yumemi_flutter_codecheck/domain/models/request_param_model.dart';

part 'api_service.g.dart';

/// [DioClient]を使用してネットワークリクエストを実行する際にパラメータを整形し、レスポンスを処理
class ApiService {
  const ApiService(this._dioClient);
  final DioClient _dioClient;

  Future<Map<String, dynamic>> fetch(String path, RequestParam param) async {
    final requestParam = param.toJson();
    try {
      final res = await _dioClient.fetch(path, requestParam);
      return res.data as Map<String, dynamic>;
    } catch (e) {
      debugPrint('ApiService: ERROR!!!! >>> $e');
      rethrow;
    }
  }
}

@Riverpod(keepAlive: true)
ApiService apiService(ApiServiceRef ref) {
  return ApiService(DioClient());
}
