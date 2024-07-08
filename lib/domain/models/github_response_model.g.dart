// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GitHubResponseImpl _$$GitHubResponseImplFromJson(Map<String, dynamic> json) =>
    _$GitHubResponseImpl(
      totalCount: (json['total_count'] as num).toInt(),
      incompleteResults: json['incomplete_results'] as bool,
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GitHubResponseImplToJson(
        _$GitHubResponseImpl instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'incomplete_results': instance.incompleteResults,
      'items': instance.items,
    };
