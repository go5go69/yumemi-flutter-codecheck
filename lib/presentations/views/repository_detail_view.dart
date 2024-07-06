import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_codecheck/app/providers/selected_item_provider.dart';
import 'package:yumemi_flutter_codecheck/constants/app_sizes.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/item_card.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/item_detail_content_card.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/item_detail_content_chip.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/view_template.dart';
import 'package:yumemi_flutter_codecheck/themes/app_color_scheme.dart';

class RepositoryDetailView extends ConsumerWidget {
  const RepositoryDetailView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItem = ref.watch(selectedItemNotifierProvider);
    return ViewTemplate.primary(
      appBar: AppBar(),
      body: selectedItem != null
          ? Column(
              children: [
                ItemCard(item: selectedItem),
                gapH16,
                ItemDetailContentChip(
                  assetPath: 'assets/images/star.svg',
                  value: '${selectedItem.stargazersCount}',
                ),
                gapH4,
                ItemDetailContentChip(
                  assetPath: 'assets/images/repo-forked.svg',
                  value: '${selectedItem.forksCount}',
                ),
                gapH16,
                ItemDetailContentCard(
                  assetPath: 'assets/images/issue-opened.svg',
                  label: 'Issue',
                  value: '${selectedItem.openIssuesCount}',
                  color: AppFixedColor.issue,
                ),
                ItemDetailContentCard(
                  assetPath: 'assets/images/issue-opened.svg',
                  label: 'Watcher',
                  value: '${selectedItem.watchersCount}',
                  color: AppFixedColor.watcher,
                ),
                ItemDetailContentCard(
                  assetPath: 'assets/images/code.svg',
                  label: 'Language',
                  value: selectedItem.language ?? '-',
                  color: AppFixedColor.language,
                ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
