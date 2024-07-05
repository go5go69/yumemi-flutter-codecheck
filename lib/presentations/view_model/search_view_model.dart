import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_codecheck/app/providers/selected_item_provider.dart';
import 'package:yumemi_flutter_codecheck/app/repository/github_res_repository.dart';
import 'package:yumemi_flutter_codecheck/domain/models/github_response_model.dart';
import 'package:yumemi_flutter_codecheck/domain/models/item_model.dart';
import 'package:yumemi_flutter_codecheck/domain/models/request_param_model.dart';
import 'package:yumemi_flutter_codecheck/presentations/routes/app_router.dart';

part 'search_view_model.g.dart';

@Riverpod(keepAlive: true)
class SearchViewModel extends _$SearchViewModel {
  @override
  GitHubResponse? build() {
    return null;
  }

  final textInputController = TextEditingController();

  Future<void> onTapSearch() async {
    final githubResRepository = ref.watch(githubResRepositoryProvider);

    final res = await githubResRepository.fetch(
      RequestParam(q: textInputController.text),
    );
    debugPrint('ITEM LENGTH: ${res.items.length}');

    state = res;
  }

  void onTapItem(BuildContext context, Item item) {
    ref.read(selectedItemNotifierProvider.notifier).updateState(item);
    context.push(Routes.detail.path);
  }
}
