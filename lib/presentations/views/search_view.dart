import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_codecheck/constants/app_sizes.dart';
import 'package:yumemi_flutter_codecheck/domain/models/item_model.dart';
import 'package:yumemi_flutter_codecheck/extensions/build_context_extension.dart';
import 'package:yumemi_flutter_codecheck/presentations/view_model/search_view_model.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/item_card.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/view_template.dart';
import 'package:yumemi_flutter_codecheck/themes/app_color_scheme.dart';
import 'package:yumemi_flutter_codecheck/themes/app_text_theme.dart';
import 'package:yumemi_flutter_codecheck/utils/app_snack_bar.dart';

class SearchView extends ConsumerWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(searchViewModelProvider);
    final pageNotifier = ref.read(searchViewModelProvider.notifier);
    return ViewTemplate.primary(
      body: CustomScrollView(
        controller: pageNotifier.scrollController,
        // コンテンツの高さがScrollViewを超えた時のみスクロールするようにする
        physics: const BouncingScrollPhysics(),
        slivers: [
          // 画面タイトル
          _appBarTitle(context.l10n.discover),

          // 検索ウィンドウ
          _appBarSearchWindow(
            context: context,
            controller: pageNotifier.textInputController,
            focusNode: pageNotifier.focusNode,
            hasFocus: pageState.hasFocus,
            onTapSearch: pageNotifier.onTapSearch,
            onTapCancel: pageNotifier.onTapCancel,
          ),

          // 検索でヒットした件数
          _appBarResultCount(
            context: context,
            hasResult: pageState.response != null,
            count: pageState.response?.totalCount,
          ),

          pageState.response != null
              ? pageState.response!.items.isNotEmpty
                  // itemsが1件以上の場合
                  ? _contentHasResult(
                      pageState.response!.items,
                      pageState.response!.totalCount,
                      context.l10n.displayedAllDesc,
                      pageNotifier.onTapItem,
                    )
                  // itemsが0件の場合
                  : _contentNoneResult(context.l10n.notMatchRepoDesc)
              // 検索前
              : _contentDefault(context.l10n.searchViewDesc)
        ],
      ),
    );
  }

  // TODO: <HIGH> 以下、別ファイルに定義するか検討

  Widget _appBarTitle(String title) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Text(title),
        titlePadding: EdgeInsets.zero,
      ),
    );
  }

  Widget _appBarSearchWindow({
    required BuildContext context,
    required TextEditingController controller,
    required FocusNode focusNode,
    required bool hasFocus,
    required Future<void> Function(BuildContext context) onTapSearch,
    required void Function() onTapCancel,
  }) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      toolbarHeight: kToolbarHeight + Sizes.p8,
      flexibleSpace: FlexibleSpaceBar(
        background: _searchWindow(
          context,
          controller,
          focusNode,
          hasFocus,
          onTapSearch,
          onTapCancel,
        ),
      ),
    );
  }

  Widget _appBarResultCount({
    required BuildContext context,
    required bool hasResult,
    required int? count,
  }) {
    return SliverAppBar(
      toolbarHeight:
          appTextTheme.bodySmall!.fontSize! * appTextTheme.bodySmall!.height!,
      flexibleSpace: FlexibleSpaceBar(
        background: hasResult
            ? Text(
                // TODO: <LOW> 3桁区切りにする
                // 例) 1000000 => 1,000,000
                '$count 件',
                style: appTextTheme.bodySmall,
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  Widget _searchWindow(
    BuildContext context,
    TextEditingController controller,
    FocusNode focusNode,
    bool hasFocus,
    Future<void> Function(BuildContext context) onTapSearch,
    void Function() onTapCancel,
  ) {
    return Row(
      children: [
        Flexible(
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            textInputAction: TextInputAction.search,
            decoration: const InputDecoration(prefixIcon: Icon(Icons.search)),
            onSubmitted: (_) async {
              try {
                await onTapSearch(context);
              } on DioException catch (e) {
                AppSnackBar.error(
                  context: context,
                  message: e.message!,
                );
              } catch (e) {
                AppSnackBar.error(
                  context: context,
                  message: e.toString(),
                );
              }
            },
          ),
        ),
        hasFocus || controller.text.isNotEmpty
            ? InkWell(
                borderRadius: BorderRadius.circular(Sizes.p8),
                onTap: () => onTapCancel(),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: Sizes.p8,
                    top: Sizes.p8,
                    bottom: Sizes.p8,
                  ),
                  child: Text(
                    context.l10n.cancel,
                    style: const TextStyle(color: AppFixedColor.action),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  Widget _contentDefault(String text) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Text(
          text,
          style: appTextTheme.headlineLarge,
        )
      ]),
    );
  }

  Widget _contentHasResult(
    List<Item> items,
    int totalCount,
    String text,
    void Function(BuildContext context, Item item) onTapItemCard,
  ) {
    return SliverList.builder(
      itemCount: items.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index < items.length) {
          return InkWell(
            onTap: () => onTapItemCard(context, items[index]),
            child: ItemCard(item: items[index]),
          );
        } else if (index == items.length && index == totalCount) {
          // 全件取得した場合
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.p16),
            child: Center(child: Text(text)),
          );
        } else {
          // まだ取得可能なリポジトリがある場合
          return const SizedBox(
            height: Sizes.p40,
            child: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }
      },
    );
  }

  Widget _contentNoneResult(String text) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [Text(text)],
      ),
    );
  }
}
