import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/constants/app_sizes.dart';
import 'package:yumemi_flutter_codecheck/themes/app_text_theme.dart';

class SettingCard extends StatelessWidget {
  final String label;
  final Widget suffixWidget;
  const SettingCard({
    super.key,
    required this.label,
    required this.suffixWidget,
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
          Text(label, style: appTextTheme.labelLarge),
          suffixWidget,
        ],
      ),
    );
  }
}
