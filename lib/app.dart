import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_codecheck/app/providers/theme_mode_provider.dart';
import 'package:yumemi_flutter_codecheck/presentations/routes/app_router.dart';
import 'package:yumemi_flutter_codecheck/themes/app_theme_data.dart';

import 'flavors.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final themeMode = switch (ref.watch(themeModeNotifierProvider)) {
      AsyncData(:final value) => value.toThemeMode(),
      _ => ThemeMode.system,
    };

    return MaterialApp.router(
      title: F.title,
      theme: AppThemeData.light().themeData,
      darkTheme: AppThemeData.dark().themeData,
      themeMode: themeMode,
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
    );
  }
}
