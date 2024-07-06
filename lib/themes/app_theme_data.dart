import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/constants/app_sizes.dart';
import 'package:yumemi_flutter_codecheck/themes/app_color_scheme.dart';
import 'package:yumemi_flutter_codecheck/themes/app_text_theme.dart';

class AppThemeData {
  final bool isDarkMode;
  final ColorScheme colorScheme;

  AppThemeData.light()
      : isDarkMode = false,
        colorScheme = AppColorScheme.light;

  AppThemeData.dark()
      : isDarkMode = true,
        colorScheme = AppColorScheme.dark;

  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      colorScheme: isDarkMode ? AppColorScheme.dark : AppColorScheme.light,
      textTheme: appTextTheme,
      // AppBar
      appBarTheme: AppBarTheme(
        titleTextStyle: appTextTheme.titleSmall,
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        iconTheme: const IconThemeData(
          size: Sizes.p20,
        ),
      ),

      // TextField
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.secondary,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(Sizes.p8),
        ),
        prefixIconColor: colorScheme.onSecondary,
        suffixIconColor: colorScheme.onSecondary,
      ),

      // textSelection
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppFixedColor.action,
        selectionColor: AppFixedColor.action.withOpacity(0.2),
        selectionHandleColor: AppFixedColor.action,
      ),
      cupertinoOverrideTheme: const CupertinoThemeData(
        // iOSにも適応
        primaryColor: AppFixedColor.action,
      ),

      // bottomNavigation
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(
          size: Sizes.p32,
        ),
        unselectedIconTheme: IconThemeData(size: Sizes.p32),
        selectedItemColor: AppFixedColor.action,
        unselectedItemColor: AppFixedColor.inactive,
      ),
    );
  }
}
