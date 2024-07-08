// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GitHubResponse _$GitHubResponseFromJson(Map<String, dynamic> json) {
  return _GitHubResponse.fromJson(json);
}

/// @nodoc
mixin _$GitHubResponse {
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'incomplete_results')
  bool get incompleteResults => throw _privateConstructorUsedError;
  List<Item> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GitHubResponseCopyWith<GitHubResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GitHubResponseCopyWith<$Res> {
  factory $GitHubResponseCopyWith(
          GitHubResponse value, $Res Function(GitHubResponse) then) =
      _$GitHubResponseCopyWithImpl<$Res, GitHubResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_count') int totalCount,
      @JsonKey(name: 'incomplete_results') bool incompleteResults,
      List<Item> items});
}

/// @nodoc
class _$GitHubResponseCopyWithImpl<$Res, $Val extends GitHubResponse>
    implements $GitHubResponseCopyWith<$Res> {
  _$GitHubResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? incompleteResults = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      incompleteResults: null == incompleteResults
          ? _value.incompleteResults
          : incompleteResults // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GitHubResponseImplCopyWith<$Res>
    implements $GitHubResponseCopyWith<$Res> {
  factory _$$GitHubResponseImplCopyWith(_$GitHubResponseImpl value,
          $Res Function(_$GitHubResponseImpl) then) =
      __$$GitHubResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_count') int totalCount,
      @JsonKey(name: 'incomplete_results') bool incompleteResults,
      List<Item> items});
}

/// @nodoc
class __$$GitHubResponseImplCopyWithImpl<$Res>
    extends _$GitHubResponseCopyWithImpl<$Res, _$GitHubResponseImpl>
    implements _$$GitHubResponseImplCopyWith<$Res> {
  __$$GitHubResponseImplCopyWithImpl(
      _$GitHubResponseImpl _value, $Res Function(_$GitHubResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? incompleteResults = null,
    Object? items = null,
  }) {
    return _then(_$GitHubResponseImpl(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      incompleteResults: null == incompleteResults
          ? _value.incompleteResults
          : incompleteResults // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GitHubResponseImpl implements _GitHubResponse {
  _$GitHubResponseImpl(
      {@JsonKey(name: 'total_count') required this.totalCount,
      @JsonKey(name: 'incomplete_results') required this.incompleteResults,
      required final List<Item> items})
      : _items = items;

  factory _$GitHubResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GitHubResponseImplFromJson(json);

  @override
  @JsonKey(name: 'total_count')
  final int totalCount;
  @override
  @JsonKey(name: 'incomplete_results')
  final bool incompleteResults;
  final List<Item> _items;
  @override
  List<Item> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'GitHubResponse(totalCount: $totalCount, incompleteResults: $incompleteResults, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GitHubResponseImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.incompleteResults, incompleteResults) ||
                other.incompleteResults == incompleteResults) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalCount, incompleteResults,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GitHubResponseImplCopyWith<_$GitHubResponseImpl> get copyWith =>
      __$$GitHubResponseImplCopyWithImpl<_$GitHubResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GitHubResponseImplToJson(
      this,
    );
  }
}

abstract class _GitHubResponse implements GitHubResponse {
  factory _GitHubResponse(
      {@JsonKey(name: 'total_count') required final int totalCount,
      @JsonKey(name: 'incomplete_results')
      required final bool incompleteResults,
      required final List<Item> items}) = _$GitHubResponseImpl;

  factory _GitHubResponse.fromJson(Map<String, dynamic> json) =
      _$GitHubResponseImpl.fromJson;

  @override
  @JsonKey(name: 'total_count')
  int get totalCount;
  @override
  @JsonKey(name: 'incomplete_results')
  bool get incompleteResults;
  @override
  List<Item> get items;
  @override
  @JsonKey(ignore: true)
  _$$GitHubResponseImplCopyWith<_$GitHubResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
