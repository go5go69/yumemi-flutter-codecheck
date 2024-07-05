import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_codecheck/app/providers/selected_item_provider.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/view_template.dart';

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
                Text(selectedItem.name),
                Image.network(
                  selectedItem.owner.avatarUrl,
                ),
                Text(selectedItem.language ?? 'None'),
                Text(selectedItem.stargazersCount.toString()),
                Text(selectedItem.watchersCount.toString()),
                Text(selectedItem.forksCount.toString()),
                Text(selectedItem.openIssuesCount.toString()),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
