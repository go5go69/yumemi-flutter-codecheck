import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/language_setting_view.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/mode_setting_page.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/repository_detail_view.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/bottom_nav.dart';

part 'app_router.g.dart';

enum Routes {
  bottomNav,
  detail,
  language,
  mode,
  ;

  String get path => '/$name';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: Routes.bottomNav.path,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: Routes.bottomNav.path,
        name: Routes.bottomNav.name,
        builder: (context, state) => const BottomNavigator(),
      ),
      GoRoute(
        path: Routes.detail.path,
        name: Routes.detail.name,
        builder: (context, state) => const RepositoryDetailView(),
      ),
      GoRoute(
        path: Routes.language.path,
        name: Routes.language.name,
        builder: (context, state) => const LanguageSettingView(),
      ),
      GoRoute(
        path: Routes.mode.path,
        name: Routes.mode.name,
        builder: (context, state) => const ModeSettingPage(),
      ),
    ],
    redirect: (context, state) async {
      // リダイレクトが不要な場合
      return null;
    },
  );
}
