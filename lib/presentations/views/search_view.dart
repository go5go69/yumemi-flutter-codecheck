import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yumemi_flutter_codecheck/constants/app_sizes.dart';
import 'package:yumemi_flutter_codecheck/presentations/routes/app_router.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/view_template.dart';

class SearchView extends ConsumerWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ViewTemplate.primary(
      body: Column(
        children: [
          const Text('this is search view.'),
          gapH16,
          FilledButton(
            onPressed: () {
              context.push(Routes.detail.path);
            },
            child: const Text('to PAGE-2'),
          ),
        ],
      ),
    );
  }
}
