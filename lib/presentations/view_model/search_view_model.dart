import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_codecheck/app/providers/selected_item_provider.dart';
import 'package:yumemi_flutter_codecheck/app/repository/github_res_repository.dart';
import 'package:yumemi_flutter_codecheck/domain/models/item_model.dart';
import 'package:yumemi_flutter_codecheck/domain/models/request_param_model.dart';
import 'package:yumemi_flutter_codecheck/presentations/models/search_view_state.dart';
import 'package:yumemi_flutter_codecheck/presentations/routes/app_router.dart';
import 'package:yumemi_flutter_codecheck/utils/app_dialog.dart';

part 'search_view_model.g.dart';

@Riverpod(keepAlive: true)
class SearchViewModel extends _$SearchViewModel {
  @override
  SearchViewState build() {
    focusNode.addListener(_onFocusChange);
    scrollController.addListener(_onScroll);
    return SearchViewState();
  }

  final textInputController = TextEditingController();
  final focusNode = FocusNode();
  final scrollController = ScrollController();

  // 1つの検索ワードで何回リクエストしたかを管理
  int requestCount = 0;
  // 1つの検索ワードに対してリクエストできる最大値
  int maxRequestCount = 0;

  // 追加でアイテムを取得中であるかの真偽値
  bool isAddingItem = false;

  void _onFocusChange() {
    state = state.copyWith(hasFocus: focusNode.hasFocus);
  }

  Future<void> _onScroll() async {
    final githubResRepository = ref.watch(githubResRepositoryProvider);

    // 新たにAPIリクエストを実行
    // - すでに取得しているItemの最後までスクロールする
    // - requestCount < maxRequestCount である
    // - isAddingItem が false である
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        requestCount < maxRequestCount &&
        !isAddingItem) {
      try {
        isAddingItem = true;
        requestCount++;
        final res = await githubResRepository.searchRepo(
          RequestParam(
            q: textInputController.text,
            page: requestCount,
          ),
        );
        // 新たに取得したItemを追加したList<Item>を持つGithubResponseを作成
        final newItems = [...state.response!.items, ...res.items];
        final newResponse = state.response!.copyWith(items: newItems);
        debugPrint('newResponse: ${newResponse.items.length}');
        // stateを更新
        state = state.copyWith(response: newResponse);
        isAddingItem = false;
      } on DioException catch (_) {
        isAddingItem = false;
        requestCount = 0;
      } catch (_) {
        isAddingItem = false;
        requestCount = 0;
      }
    }
  }

  Future<void> onTapSearch(BuildContext context) async {
    // indicatorを表示
    AppDialog.indicator(context);

    final githubResRepository = ref.watch(githubResRepositoryProvider);

    try {
      // requestCountは検索初回のため「1」
      requestCount = 1;

      // APIリクエストを実行
      final res = await githubResRepository.searchRepo(
        RequestParam(q: textInputController.text, page: requestCount),
      );
      maxRequestCount = (res.totalCount / 30).ceil();

      state = state.copyWith(response: res);

      // indicatorをpop
      context.pop();
    } on DioException catch (_) {
      requestCount = 0;
      // indicatorをpop
      context.pop();
      rethrow;
    } catch (_) {
      requestCount = 0;
      // indicatorをpop
      context.pop();
      rethrow;
    }
  }

  void onTapCancel() {
    if (state.response != null) {
      state = state.copyWith(response: null);
    }
    requestCount = 0;
    textInputController.clear();
    focusNode.unfocus();
  }

  void onTapItem(BuildContext context, Item item) {
    ref.read(selectedItemNotifierProvider.notifier).updateState(item);
    context.push(Routes.detail.path);
  }
}
