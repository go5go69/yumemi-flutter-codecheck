import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_provider.g.dart';

/// !!Important!! 列挙の順番は必ず[L10n.supportedLocales]を参照すること
enum LangType {
  en,
  es,
  ja,
  zh;

  @override
  String toString() {
    switch (this) {
      case en:
        return 'English';
      case es:
        return 'Español';
      case ja:
        return '日本語';
      case zh:
        return '中文';
      default:
        return '';
    }
  }
}

/// アプリの言語設定の状態を管理する
@Riverpod(keepAlive: true)
class LanguageNotifier extends _$LanguageNotifier {
  static const key = 'language';
  final supportedLocales = L10n.supportedLocales;
  @override
  Future<Locale> build() async {
    final pref = await SharedPreferences.getInstance();
    final localeIndex = pref.getInt(key);
    // SharedPreferencesに保存されていない場合は、端末のデフォルト言語を設定する
    if (localeIndex == null) {
      // 端末の設定言語を取得
      final deviceLangCode =
          WidgetsBinding.instance.platformDispatcher.locale.languageCode;
      for (var locale in supportedLocales) {
        if (locale.languageCode == deviceLangCode) {
          // 端末の設定言語がサポートされている場合はその言語を使用
          return locale;
        }
      }
      // 端末の設定言語がサポートされていない場合はアプリのデフォルト言語を使用(English)
      return supportedLocales[0];
    } else {
      return supportedLocales[localeIndex];
    }
  }

  /// 言語変更メソッド
  Future<void> setLanguage(LangType type) async {
    final pref = await SharedPreferences.getInstance();
    // SharedPreferencesの更新
    pref.setInt(key, type.index);
    // Stateの更新
    state = AsyncValue.data(supportedLocales[type.index]);
  }
}
