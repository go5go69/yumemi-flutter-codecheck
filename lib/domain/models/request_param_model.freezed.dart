// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_param_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestParam _$RequestParamFromJson(Map<String, dynamic> json) {
  return _RequestParam.fromJson(json);
}

/// @nodoc
mixin _$RequestParam {
  String get q => throw _privateConstructorUsedError;
  String? get sort => throw _privateConstructorUsedError;
  String? get order => throw _privateConstructorUsedError;
  int get perPage => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestParamCopyWith<RequestParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestParamCopyWith<$Res> {
  factory $RequestParamCopyWith(
          RequestParam value, $Res Function(RequestParam) then) =
      _$RequestParamCopyWithImpl<$Res, RequestParam>;
  @useResult
  $Res call({String q, String? sort, String? order, int perPage, int page});
}

/// @nodoc
class _$RequestParamCopyWithImpl<$Res, $Val extends RequestParam>
    implements $RequestParamCopyWith<$Res> {
  _$RequestParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? q = null,
    Object? sort = freezed,
    Object? order = freezed,
    Object? perPage = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      q: null == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String?,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestParamImplCopyWith<$Res>
    implements $RequestParamCopyWith<$Res> {
  factory _$$RequestParamImplCopyWith(
          _$RequestParamImpl value, $Res Function(_$RequestParamImpl) then) =
      __$$RequestParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String q, String? sort, String? order, int perPage, int page});
}

/// @nodoc
class __$$RequestParamImplCopyWithImpl<$Res>
    extends _$RequestParamCopyWithImpl<$Res, _$RequestParamImpl>
    implements _$$RequestParamImplCopyWith<$Res> {
  __$$RequestParamImplCopyWithImpl(
      _$RequestParamImpl _value, $Res Function(_$RequestParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? q = null,
    Object? sort = freezed,
    Object? order = freezed,
    Object? perPage = null,
    Object? page = null,
  }) {
    return _then(_$RequestParamImpl(
      q: null == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String?,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestParamImpl implements _RequestParam {
  _$RequestParamImpl(
      {required this.q,
      this.sort,
      this.order,
      this.perPage = 30,
      this.page = 1});

  factory _$RequestParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestParamImplFromJson(json);

  @override
  final String q;
  @override
  final String? sort;
  @override
  final String? order;
  @override
  @JsonKey()
  final int perPage;
  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'RequestParam(q: $q, sort: $sort, order: $order, perPage: $perPage, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestParamImpl &&
            (identical(other.q, q) || other.q == q) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, q, sort, order, perPage, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestParamImplCopyWith<_$RequestParamImpl> get copyWith =>
      __$$RequestParamImplCopyWithImpl<_$RequestParamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestParamImplToJson(
      this,
    );
  }
}

abstract class _RequestParam implements RequestParam {
  factory _RequestParam(
      {required final String q,
      final String? sort,
      final String? order,
      final int perPage,
      final int page}) = _$RequestParamImpl;

  factory _RequestParam.fromJson(Map<String, dynamic> json) =
      _$RequestParamImpl.fromJson;

  @override
  String get q;
  @override
  String? get sort;
  @override
  String? get order;
  @override
  int get perPage;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$RequestParamImplCopyWith<_$RequestParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
