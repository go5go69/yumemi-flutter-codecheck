// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'license_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

License _$LicenseFromJson(Map<String, dynamic> json) {
  return _License.fromJson(json);
}

/// @nodoc
mixin _$License {
  String get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'spdx_id')
  String get spdxId => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'node_id')
  String get nodeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LicenseCopyWith<License> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LicenseCopyWith<$Res> {
  factory $LicenseCopyWith(License value, $Res Function(License) then) =
      _$LicenseCopyWithImpl<$Res, License>;
  @useResult
  $Res call(
      {String key,
      String name,
      @JsonKey(name: 'spdx_id') String spdxId,
      String? url,
      @JsonKey(name: 'node_id') String nodeId});
}

/// @nodoc
class _$LicenseCopyWithImpl<$Res, $Val extends License>
    implements $LicenseCopyWith<$Res> {
  _$LicenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? spdxId = null,
    Object? url = freezed,
    Object? nodeId = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      spdxId: null == spdxId
          ? _value.spdxId
          : spdxId // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      nodeId: null == nodeId
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LicenseImplCopyWith<$Res> implements $LicenseCopyWith<$Res> {
  factory _$$LicenseImplCopyWith(
          _$LicenseImpl value, $Res Function(_$LicenseImpl) then) =
      __$$LicenseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String key,
      String name,
      @JsonKey(name: 'spdx_id') String spdxId,
      String? url,
      @JsonKey(name: 'node_id') String nodeId});
}

/// @nodoc
class __$$LicenseImplCopyWithImpl<$Res>
    extends _$LicenseCopyWithImpl<$Res, _$LicenseImpl>
    implements _$$LicenseImplCopyWith<$Res> {
  __$$LicenseImplCopyWithImpl(
      _$LicenseImpl _value, $Res Function(_$LicenseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? spdxId = null,
    Object? url = freezed,
    Object? nodeId = null,
  }) {
    return _then(_$LicenseImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      spdxId: null == spdxId
          ? _value.spdxId
          : spdxId // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      nodeId: null == nodeId
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LicenseImpl implements _License {
  _$LicenseImpl(
      {required this.key,
      required this.name,
      @JsonKey(name: 'spdx_id') required this.spdxId,
      this.url,
      @JsonKey(name: 'node_id') required this.nodeId});

  factory _$LicenseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LicenseImplFromJson(json);

  @override
  final String key;
  @override
  final String name;
  @override
  @JsonKey(name: 'spdx_id')
  final String spdxId;
  @override
  final String? url;
  @override
  @JsonKey(name: 'node_id')
  final String nodeId;

  @override
  String toString() {
    return 'License(key: $key, name: $name, spdxId: $spdxId, url: $url, nodeId: $nodeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LicenseImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.spdxId, spdxId) || other.spdxId == spdxId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.nodeId, nodeId) || other.nodeId == nodeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key, name, spdxId, url, nodeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LicenseImplCopyWith<_$LicenseImpl> get copyWith =>
      __$$LicenseImplCopyWithImpl<_$LicenseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LicenseImplToJson(
      this,
    );
  }
}

abstract class _License implements License {
  factory _License(
      {required final String key,
      required final String name,
      @JsonKey(name: 'spdx_id') required final String spdxId,
      final String? url,
      @JsonKey(name: 'node_id') required final String nodeId}) = _$LicenseImpl;

  factory _License.fromJson(Map<String, dynamic> json) = _$LicenseImpl.fromJson;

  @override
  String get key;
  @override
  String get name;
  @override
  @JsonKey(name: 'spdx_id')
  String get spdxId;
  @override
  String? get url;
  @override
  @JsonKey(name: 'node_id')
  String get nodeId;
  @override
  @JsonKey(ignore: true)
  _$$LicenseImplCopyWith<_$LicenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
