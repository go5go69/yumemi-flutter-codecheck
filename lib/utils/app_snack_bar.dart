import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/themes/app_color_scheme.dart';

class AppSnackBar {
  AppSnackBar._();

  /// 汎用的なスナックバー表示メソッド
  static void show({
    required BuildContext context,
    required Widget content,
    Color? backgroundColor,
    SnackBarBehavior? behavior = SnackBarBehavior.floating,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        behavior: behavior,
        content: content,
      ),
    );
  }

  /// エラー表示
  static void error({
    required BuildContext context,
    required String message,
  }) {
    show(
      context: context,
      content: Text(message),
      backgroundColor: AppFixedColor.error,
    );
  }
}
