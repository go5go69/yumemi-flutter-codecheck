import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yumemi_flutter_codecheck/constants/app_sizes.dart';
import 'package:yumemi_flutter_codecheck/presentations/routes/app_router.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/view_template.dart';

class SettingView extends ConsumerWidget {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ViewTemplate.primary(
      body: Column(
        children: [
          const Text('this is setting view.'),
          gapH16,
          FilledButton(
              onPressed: () {
                context.push(Routes.language.path);
              },
              child: const Text('PAGE-4')),
          gapH16,
          FilledButton(
              onPressed: () {
                context.push(Routes.mode.path);
              },
              child: const Text('PAGE-5')),
        ],
      ),
    );
  }
}
