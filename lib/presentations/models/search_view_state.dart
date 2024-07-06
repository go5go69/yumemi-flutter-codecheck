import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumemi_flutter_codecheck/domain/models/github_response_model.dart';

part 'search_view_state.freezed.dart';

@freezed
class SearchViewState with _$SearchViewState {
  factory SearchViewState({
    GitHubResponse? response,
    @Default(false) bool hasFocus,
  }) = _SearchViewState;
}
