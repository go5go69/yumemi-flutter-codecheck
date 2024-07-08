import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_codecheck/app/providers/selected_item_provider.dart';
import 'package:yumemi_flutter_codecheck/app/repository/github_res_repository.dart';
import 'package:yumemi_flutter_codecheck/domain/models/item_model.dart';
import 'package:yumemi_flutter_codecheck/domain/models/request_param_model.dart';
import 'package:yumemi_flutter_codecheck/presentations/models/search_view_state.dart';
import 'package:yumemi_flutter_codecheck/presentations/routes/app_router.dart';

part 'search_view_model.g.dart';

@Riverpod(keepAlive: true)
class SearchViewModel extends _$SearchViewModel {
  @override
  SearchViewState build() {
    focusNode.addListener(_onFocusChange);
    return SearchViewState();
  }

  final textInputController = TextEditingController();
  final focusNode = FocusNode();

  void _onFocusChange() {
    state = state.copyWith(hasFocus: focusNode.hasFocus);
  }

  Future<void> onTapSearch() async {
    final githubResRepository = ref.watch(githubResRepositoryProvider);

    final res = await githubResRepository.searchRepo(
      RequestParam(q: textInputController.text),
    );

    state = state.copyWith(response: res);
  }

  void onTapCancel() {
    if (state.response != null) {
      state = state.copyWith(response: null);
    }
    textInputController.clear();
    focusNode.unfocus();
  }

  void onTapItem(BuildContext context, Item item) {
    ref.read(selectedItemNotifierProvider.notifier).updateState(item);
    context.push(Routes.detail.path);
  }
}
