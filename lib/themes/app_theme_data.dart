import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/themes/app_color_scheme.dart';
import 'package:yumemi_flutter_codecheck/themes/app_text_theme.dart';

class AppThemeData {
  final bool isDarkMode;

  AppThemeData.light() : isDarkMode = false;
  AppThemeData.dark() : isDarkMode = true;

  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      colorScheme: isDarkMode ? AppColorScheme.dark : AppColorScheme.light,
      textTheme: appTextTheme,
      // 以下にWidgetのThemeを追加する
    );
  }
}
