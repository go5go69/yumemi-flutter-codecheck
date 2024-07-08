// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_param_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestParamImpl _$$RequestParamImplFromJson(Map<String, dynamic> json) =>
    _$RequestParamImpl(
      q: json['q'] as String,
      sort: json['sort'] as String?,
      order: json['order'] as String?,
      perPage: (json['perPage'] as num?)?.toInt() ?? 30,
      page: (json['page'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$RequestParamImplToJson(_$RequestParamImpl instance) =>
    <String, dynamic>{
      'q': instance.q,
      'sort': instance.sort,
      'order': instance.order,
      'perPage': instance.perPage,
      'page': instance.page,
    };
