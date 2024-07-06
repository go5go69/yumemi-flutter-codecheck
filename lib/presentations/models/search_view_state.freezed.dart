// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchViewState {
  GitHubResponse? get response => throw _privateConstructorUsedError;
  bool get hasFocus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchViewStateCopyWith<SearchViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchViewStateCopyWith<$Res> {
  factory $SearchViewStateCopyWith(
          SearchViewState value, $Res Function(SearchViewState) then) =
      _$SearchViewStateCopyWithImpl<$Res, SearchViewState>;
  @useResult
  $Res call({GitHubResponse? response, bool hasFocus});

  $GitHubResponseCopyWith<$Res>? get response;
}

/// @nodoc
class _$SearchViewStateCopyWithImpl<$Res, $Val extends SearchViewState>
    implements $SearchViewStateCopyWith<$Res> {
  _$SearchViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
    Object? hasFocus = null,
  }) {
    return _then(_value.copyWith(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as GitHubResponse?,
      hasFocus: null == hasFocus
          ? _value.hasFocus
          : hasFocus // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GitHubResponseCopyWith<$Res>? get response {
    if (_value.response == null) {
      return null;
    }

    return $GitHubResponseCopyWith<$Res>(_value.response!, (value) {
      return _then(_value.copyWith(response: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchViewStateImplCopyWith<$Res>
    implements $SearchViewStateCopyWith<$Res> {
  factory _$$SearchViewStateImplCopyWith(_$SearchViewStateImpl value,
          $Res Function(_$SearchViewStateImpl) then) =
      __$$SearchViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GitHubResponse? response, bool hasFocus});

  @override
  $GitHubResponseCopyWith<$Res>? get response;
}

/// @nodoc
class __$$SearchViewStateImplCopyWithImpl<$Res>
    extends _$SearchViewStateCopyWithImpl<$Res, _$SearchViewStateImpl>
    implements _$$SearchViewStateImplCopyWith<$Res> {
  __$$SearchViewStateImplCopyWithImpl(
      _$SearchViewStateImpl _value, $Res Function(_$SearchViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
    Object? hasFocus = null,
  }) {
    return _then(_$SearchViewStateImpl(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as GitHubResponse?,
      hasFocus: null == hasFocus
          ? _value.hasFocus
          : hasFocus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SearchViewStateImpl implements _SearchViewState {
  _$SearchViewStateImpl({this.response, this.hasFocus = false});

  @override
  final GitHubResponse? response;
  @override
  @JsonKey()
  final bool hasFocus;

  @override
  String toString() {
    return 'SearchViewState(response: $response, hasFocus: $hasFocus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchViewStateImpl &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.hasFocus, hasFocus) ||
                other.hasFocus == hasFocus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response, hasFocus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchViewStateImplCopyWith<_$SearchViewStateImpl> get copyWith =>
      __$$SearchViewStateImplCopyWithImpl<_$SearchViewStateImpl>(
          this, _$identity);
}

abstract class _SearchViewState implements SearchViewState {
  factory _SearchViewState(
      {final GitHubResponse? response,
      final bool hasFocus}) = _$SearchViewStateImpl;

  @override
  GitHubResponse? get response;
  @override
  bool get hasFocus;
  @override
  @JsonKey(ignore: true)
  _$$SearchViewStateImplCopyWith<_$SearchViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
