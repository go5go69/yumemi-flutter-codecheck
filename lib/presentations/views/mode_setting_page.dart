import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_codecheck/app/providers/theme_mode_provider.dart';
import 'package:yumemi_flutter_codecheck/extensions/build_context_extension.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/setting_card.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/view_template.dart';
import 'package:yumemi_flutter_codecheck/themes/app_color_scheme.dart';

class ModeSettingPage extends ConsumerWidget {
  const ModeSettingPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = switch (ref.watch(themeModeNotifierProvider)) {
      AsyncData(:final value) => value,
      _ => ThemeType.system,
    };
    final themeModeNotifier = ref.read(themeModeNotifierProvider.notifier);
    return ViewTemplate.primary(
        appBar: AppBar(title: Text(context.l10n.theme)),
        body: ListView.builder(
          itemCount: ThemeType.values.length,
          itemBuilder: (context, index) {
            final type = ThemeType.values[index];
            return _themeSettingCard(
              context,
              type,
              themeModeState,
              themeModeNotifier.setThemeType,
            );
          },
        ));
  }

  /// Themeを変更するためのカード
  /// - 設定中のThemeの場合チェックが表示
  InkWell _themeSettingCard(
    BuildContext context,
    ThemeType type,
    ThemeType currentType,
    Future<void> Function(ThemeType type) onTap,
  ) {
    return InkWell(
      onTap: () => onTap(type),
      child: SettingCard(
        label: type.toWord(context),
        suffixWidget: Visibility(
          visible: currentType == type,
          maintainState: true,
          maintainAnimation: true,
          maintainSize: true,
          child: const Icon(Icons.check_circle, color: AppFixedColor.action),
        ),
      ),
    );
  }
}
