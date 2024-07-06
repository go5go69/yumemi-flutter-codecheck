import 'package:flutter/material.dart';

class AppColorScheme {
  // ライトモード
  static const light = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF0B080B),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFF0F0F0),
    onSecondary: Color(0xFF999999),
    error: AppFixedColor.error,
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF140F1F),
    outline: Color(0xFFE6E6E6),
  );

  // ダークモード
  static const dark = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFFFFFFF),
    onPrimary: Color(0xFF0B080B),
    secondary: Color(0xFF505050),
    onSecondary: Color(0xFF999999),
    error: AppFixedColor.error,
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFF0B080B),
    onSurface: Color(0xFFFFFFFF),
    outline: Color(0xFF505050),
  );
}

/// Lightモード, Darkモードに関係なく使用されるカラーアセット
/// - Functionalカラーなど
class AppFixedColor {
  static const action = Color(0xFF057CFF);
  static const error = Color(0xFFFF334B);
  static const inactive = Color(0xFFCFCFCF);
  // GitHub Color
  static const issue = Color(0xFF40D663);
  static const watcher = Color(0xFFFFD74D);
  static const language = Color(0xFF9194A1);
}
