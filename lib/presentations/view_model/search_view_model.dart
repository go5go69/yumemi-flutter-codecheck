import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_codecheck/app/repository/github_res_repository.dart';
import 'package:yumemi_flutter_codecheck/domain/models/github_response_model.dart';
import 'package:yumemi_flutter_codecheck/domain/models/request_param_model.dart';

part 'search_view_model.g.dart';

@Riverpod(keepAlive: true)
class SearchViewModel extends _$SearchViewModel {
  @override
  GitHubResponse? build() {
    return null;
  }

  Future<void> onTapSearch() async {
    final githubResRepository = ref.watch(githubResRepositoryProvider);

    final res =
        await githubResRepository.fetch(RequestParam(q: 'flutter animation'));
    debugPrint('ITEM LENGTH: ${res.items.length}');

    state = res;
  }
}
