import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_codecheck/constants/app_sizes.dart';
import 'package:yumemi_flutter_codecheck/domain/models/item_model.dart';
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
        // コンテンツの高さがScrollViewを超えた時のみスクロールするようにする
        physics: const BouncingScrollPhysics(),
        slivers: [
          // 画面タイトル
          _appBarTitle(),

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
                      pageNotifier.onTapItem,
                    )
                  // itemsが0件の場合
                  : _contentNoneResult()
              // 検索前
              : _contentDefault()
        ],
      ),
    );
  }

  // TODO: <HIGH> 以下、別ファイルに定義するか検討

  Widget _appBarTitle() {
    return const SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Text('Discover'),
        titlePadding: EdgeInsets.zero,
      ),
    );
  }

  Widget _appBarSearchWindow({
    required BuildContext context,
    required TextEditingController controller,
    required FocusNode focusNode,
    required bool hasFocus,
    required Future<void> Function() onTapSearch,
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
    Future<void> Function() onTapSearch,
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
                await onTapSearch();
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
                child: const Padding(
                  padding: EdgeInsets.only(
                    left: Sizes.p8,
                    top: Sizes.p8,
                    bottom: Sizes.p8,
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: AppFixedColor.action),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  Widget _contentDefault() {
    return SliverList(
      delegate: SliverChildListDelegate([
        Text(
          'Discover\namazing\nrepositories\non GitHub',
          style: appTextTheme.headlineLarge,
        )
      ]),
    );
  }

  Widget _contentHasResult(
    List<Item> items,
    void Function(BuildContext context, Item item) onTap,
  ) {
    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => onTap(context, items[index]),
          child: ItemCard(item: items[index]),
        );
      },
    );
  }

  Widget _contentNoneResult() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [const Text('Your search did not match any repositories')],
      ),
    );
  }
}
