import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_param_model.freezed.dart';
part 'request_param_model.g.dart';

/// APIリクエスト時に含めることができるクエリをクライアント側で扱いやすくするための型
/// - 使用方法は[公式Doc](https://docs.github.com/ja/rest/search/search?apiVersion=2022-11-28#search-repositories--parameters)を参照
@freezed
class RequestParam with _$RequestParam {
  factory RequestParam({
    required String q,
    String? sort,
    String? order,
    @Default(30) int perPage,
    @Default(1) int page,
  }) = _RequestParam;

  // fromJsonを利用する場面はないが、toJson自動生成のために記載
  factory RequestParam.fromJson(Map<String, dynamic> json) =>
      _$RequestParamFromJson(json);
}
