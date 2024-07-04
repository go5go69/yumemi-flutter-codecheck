import 'package:flutter/material.dart';

class AppColorScheme {
  // ライトモード
  static const light = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF0B080B),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFCFCFCF),
    onSecondary: Color(0xFF140F1F),
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
    secondary: Color(0xFF444444),
    onSecondary: Color(0xFFFFFFFF),
    error: AppFixedColor.error,
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFF0B080B),
    onSurface: Color(0xFFFFFFFF),
    outline: Color(0xFFB0B0B0),
  );
}

/// Lightモード, Darkモードに関係なく使用されるカラーアセット
/// - Functionalカラーなど
class AppFixedColor {
  static const error = Color(0xFFFF334B);
}
