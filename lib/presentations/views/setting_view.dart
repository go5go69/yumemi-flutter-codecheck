import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yumemi_flutter_codecheck/presentations/routes/app_router.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/setting_card.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/view_template.dart';

class SettingView extends ConsumerWidget {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ViewTemplate.primary(
      appBar: AppBar(title: const Text('Settings')),
      body: Column(
        children: [
          InkWell(
            onTap: () => context.push(Routes.mode.path),
            child: const SettingCard(
              label: 'Theme',
              suffixWidget: Icon(Icons.navigate_next),
            ),
          )
        ],
      ),
    );
  }
}
