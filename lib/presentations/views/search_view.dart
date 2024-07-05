import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_codecheck/constants/app_sizes.dart';
import 'package:yumemi_flutter_codecheck/presentations/view_model/search_view_model.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/view_template.dart';

class SearchView extends ConsumerWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(searchViewModelProvider);
    final pageNotifier = ref.read(searchViewModelProvider.notifier);
    return ViewTemplate.primary(
      appBar: AppBar(
        title: _textFormField(
          pageNotifier.textInputController,
          pageNotifier.onTapSearch,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          pageState != null
              ? SliverList.builder(
                  itemCount: pageState.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = pageState.items[index];
                    return InkWell(
                      onTap: () => pageNotifier.onTapItem(context, item),
                      child: Container(
                        padding: const EdgeInsets.all(Sizes.p12),
                        child: Text(item.name),
                      ),
                    );
                  },
                )
              : SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox.shrink(),
                  ]),
                ),
        ],
      ),
    );
  }

  Widget _textFormField(
    TextEditingController controller,
    Future<void> Function() onTap,
  ) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.search,
      onSubmitted: (_) async => await onTap(),
    );
  }
}
