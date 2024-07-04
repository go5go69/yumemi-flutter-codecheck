import 'package:flutter/material.dart';

class AppColorScheme {
  // ライトモード
  static const light = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFFFFFFF),
    onPrimary: Color(0xFF140F1F),
    secondary: Color(0xFFF5F5F5),
    onSecondary: Color(0xFF140F1F),
    error: AppFixedColor.error,
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF140F1F),
  );

  // ダークモード
  static const dark = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF0B080B),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFF5F5F5),
    onSecondary: Color(0xFF140F1F),
    error: AppFixedColor.error,
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFF0B080B),
    onSurface: Color(0xFFFFFFFF),
  );
}

/// Lightモード, Darkモードに関係なく使用されるカラーアセット
/// - Functionalカラーなど
class AppFixedColor {
  static const error = Color(0xFFFF334B);
}
