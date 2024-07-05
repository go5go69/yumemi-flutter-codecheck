// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'license_model.freezed.dart';
part 'license_model.g.dart';

/// APIレスポンスのItemプロパティ内のlicenseプロパティをクライアント側で扱いやすくするための型
@freezed
class License with _$License {
  factory License({
    required String key,
    required String name,
    @JsonKey(name: 'spdx_id') required String spdxId,
    String? url,
    @JsonKey(name: 'node_id') required String nodeId,
  }) = _License;

  factory License.fromJson(Map<String, dynamic> json) =>
      _$LicenseFromJson(json);
}
