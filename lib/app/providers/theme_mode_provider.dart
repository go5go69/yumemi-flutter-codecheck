import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yumemi_flutter_codecheck/extensions/build_context_extension.dart';

part 'theme_mode_provider.g.dart';

enum ThemeType {
  system,
  light,
  dark,
  ;

  String toWord(BuildContext context) {
    switch (this) {
      case ThemeType.light:
        return context.l10n.light;
      case ThemeType.dark:
        return context.l10n.dark;
      case ThemeType.system:
        return context.l10n.system;
    }
  }

  ThemeMode toThemeMode() {
    switch (this) {
      case ThemeType.light:
        return ThemeMode.light;
      case ThemeType.dark:
        return ThemeMode.dark;
      case ThemeType.system:
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }
}

@Riverpod(keepAlive: true)
class ThemeModeNotifier extends _$ThemeModeNotifier {
  static const key = 'themeType';
  @override
  Future<ThemeType> build() async {
    final pref = await SharedPreferences.getInstance();
    final themeIndex = pref.getInt(key) ?? ThemeType.system.index;
    return ThemeType.values[themeIndex];
  }

  Future<void> setThemeType(ThemeType type) async {
    final pref = await SharedPreferences.getInstance();
    pref.setInt(key, type.index);
    state = AsyncValue.data(type);
  }
}
