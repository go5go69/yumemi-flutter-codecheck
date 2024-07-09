import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/constants/app_sizes.dart';
import 'package:yumemi_flutter_codecheck/themes/app_text_theme.dart';

/// 設定項目の表示に使用
class SettingCard extends StatelessWidget {
  final String label;
  final Widget suffixWidget; // Widget右端に表示
  final Widget? prefixWidget; // Widget左端に表示
  const SettingCard({
    super.key,
    required this.label,
    required this.suffixWidget,
    this.prefixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Sizes.p16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              prefixWidget ?? const SizedBox.shrink(),
              gapW8,
              Text(label, style: appTextTheme.labelLarge),
            ],
          ),
          suffixWidget,
        ],
      ),
    );
  }
}
