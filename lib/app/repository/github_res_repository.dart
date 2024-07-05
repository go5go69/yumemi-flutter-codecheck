import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_codecheck/data/services/api_service.dart';
import 'package:yumemi_flutter_codecheck/domain/models/github_response_model.dart';
import 'package:yumemi_flutter_codecheck/domain/models/request_param_model.dart';

part 'github_res_repository.g.dart';

/// [ApiService]を使用してGitHub APIから取得したデータをアプリケーション内で使用可能なドメインモデルに変換
class GithubResRepository {
  final ApiService _apiService;

  GithubResRepository(this._apiService);

  Future<GitHubResponse> fetch(RequestParam param) async {
    try {
      final json = await _apiService.fetch(param);
      return GitHubResponse.fromJson(json);
    } catch (e) {
      debugPrint('GithubResRepository: ERROR!!!! >>> $e');
      throw Exception('Failed to fetch data');
    }
  }
}

@Riverpod(keepAlive: true)
GithubResRepository githubResRepository(GithubResRepositoryRef ref) {
  return GithubResRepository(ref.watch(apiServiceProvider));
}
