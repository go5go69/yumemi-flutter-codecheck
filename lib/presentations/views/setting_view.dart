import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yumemi_flutter_codecheck/extensions/build_context_extension.dart';
import 'package:yumemi_flutter_codecheck/presentations/routes/app_router.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/setting_card.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/view_template.dart';

class SettingView extends ConsumerWidget {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ViewTemplate.primary(
      appBar: AppBar(title: Text(context.l10n.setting)),
      body: Column(
        children: [
          // Theme設定画面へ遷移
          InkWell(
            onTap: () => context.push(Routes.mode.path),
            child: SettingCard(
              label: context.l10n.theme,
              suffixWidget: const Icon(Icons.navigate_next),
              prefixWidget: const Icon(Icons.contrast),
            ),
          ),

          // 言語設定画面へ遷移
          InkWell(
            onTap: () => context.push(Routes.language.path),
            child: SettingCard(
              label: context.l10n.language,
              suffixWidget: const Icon(Icons.navigate_next),
              prefixWidget: const Icon(Icons.language),
            ),
          )
        ],
      ),
    );
  }
}
