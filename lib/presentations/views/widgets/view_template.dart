import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/constants/app_sizes.dart';
import 'package:yumemi_flutter_codecheck/flavors.dart';

class ViewTemplate extends StatelessWidget {
  final EdgeInsetsGeometry viewPadding;
  final bool bottomSafeArea;
  final PreferredSizeWidget? appBar;
  final Widget body;
  const ViewTemplate({
    super.key,
    required this.viewPadding,
    this.bottomSafeArea = true,
    this.appBar,
    required this.body,
  });

  /// 余白なしの画面
  /// - 画像がメインとなる画面等で使用する
  factory ViewTemplate.paddingNone({
    required Widget body,
    bool bottomSafeArea = true,
    PreferredSizeWidget? appBar,
  }) {
    return ViewTemplate(
      bottomSafeArea: bottomSafeArea,
      appBar: appBar,
      viewPadding: EdgeInsets.zero,
      body: body,
    );
  }

  /// アプリ内で使用する基本の画面（水平方向に16の余白）
  factory ViewTemplate.primary({
    required Widget body,
    bool bottomSafeArea = true,
    PreferredSizeWidget? appBar,
  }) {
    return ViewTemplate(
      bottomSafeArea: bottomSafeArea,
      appBar: appBar,
      viewPadding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
      body: body,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _flavorBanner(
      show: kDebugMode,
      child: Scaffold(
        appBar: appBar,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            bottom: bottomSafeArea,
            child: Padding(
              padding: viewPadding,
              child: body,
            ),
          ),
        ),
      ),
    );
  }
}

Widget _flavorBanner({
  required Widget child,
  bool show = true,
}) =>
    show
        ? Banner(
            child: child,
            location: BannerLocation.topStart,
            message: F.name,
            color: Colors.green.withOpacity(0.6),
            textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12.0,
                letterSpacing: 1.0),
            textDirection: TextDirection.ltr,
          )
        : Container(
            child: child,
          );
