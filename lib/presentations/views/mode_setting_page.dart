import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_codecheck/app/providers/theme_mode_provider.dart';
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
      appBar: AppBar(title: const Text('Theme')),
      body: Column(
        children: [
          _themeSettingCard(
            ThemeType.light,
            themeModeState,
            themeModeNotifier.setThemeType,
          ),
          _themeSettingCard(
            ThemeType.dark,
            themeModeState,
            themeModeNotifier.setThemeType,
          ),
          _themeSettingCard(
            ThemeType.system,
            themeModeState,
            themeModeNotifier.setThemeType,
          ),
        ],
      ),
    );
  }

  InkWell _themeSettingCard(
    ThemeType type,
    ThemeType currentType,
    Future<void> Function(ThemeType type) onTap,
  ) {
    return InkWell(
      onTap: () => onTap(type),
      child: SettingCard(
        label: type.name,
        suffixWidget: currentType == type
            ? const Icon(Icons.check_circle, color: AppFixedColor.action)
            : const SizedBox.shrink(),
      ),
    );
  }
}
