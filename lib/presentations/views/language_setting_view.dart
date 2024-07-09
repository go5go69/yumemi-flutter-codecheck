import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_codecheck/app/providers/language_provider.dart';
import 'package:yumemi_flutter_codecheck/extensions/build_context_extension.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/setting_card.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/view_template.dart';
import 'package:yumemi_flutter_codecheck/themes/app_color_scheme.dart';

class LanguageSettingView extends ConsumerWidget {
  const LanguageSettingView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageState = switch (ref.watch(languageNotifierProvider)) {
      AsyncData(:final value) => value,
      _ => null,
    };
    final languageNotifier = ref.read(languageNotifierProvider.notifier);
    return ViewTemplate.primary(
      appBar: AppBar(title: Text(context.l10n.language)),
      body: languageState != null
          // LangTypeの個数分表示する
          ? ListView.builder(
              itemCount: LangType.values.length,
              itemBuilder: (context, index) {
                final type = LangType.values[index];
                return _langSettingCard(
                  type,
                  languageState.languageCode,
                  languageNotifier.setLanguage,
                );
              },
            )
          : const SizedBox.shrink(),
    );
  }

  /// 言語を変更するためのカード
  /// - 設定中の言語の場合チェックが表示
  InkWell _langSettingCard(
    LangType type,
    String currentLangCode,
    Future<void> Function(LangType type) onTap,
  ) {
    return InkWell(
      onTap: () => onTap(type),
      child: SettingCard(
        label: type.toString(),
        suffixWidget: Visibility(
          visible: currentLangCode == type.name,
          maintainState: true,
          maintainAnimation: true,
          maintainSize: true,
          child: const Icon(Icons.check_circle, color: AppFixedColor.action),
        ),
      ),
    );
  }
}
