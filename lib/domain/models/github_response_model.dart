// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'item_model.dart';

part 'github_response_model.freezed.dart';
part 'github_response_model.g.dart';

/// APIレスポンスをクライアント側で扱いやすくするための型
/// - 応答スキーマは[公式Doc](https://docs.github.com/ja/rest/search/search?apiVersion=2022-11-28#search-repositories)を参照
@freezed
class GitHubResponse with _$GitHubResponse {
  factory GitHubResponse({
    @JsonKey(name: 'total_count') required int totalCount,
    @JsonKey(name: 'incomplete_results') required bool incompleteResults,
    required List<Item> items,
  }) = _GitHubResponse;

  factory GitHubResponse.fromJson(Map<String, dynamic> json) =>
      _$GitHubResponseFromJson(json);
}
