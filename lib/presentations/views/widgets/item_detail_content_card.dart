import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumemi_flutter_codecheck/constants/app_sizes.dart';
import 'package:yumemi_flutter_codecheck/extensions/build_context_extension.dart';
import 'package:yumemi_flutter_codecheck/themes/app_text_theme.dart';

// TODO: <MID> enum化して、値に対応するlabelなどを管理するようにするか検討

/// リポジトリの詳細を表示
class ItemDetailContentCard extends StatelessWidget {
  final String assetPath;
  final String label; // 例: Language
  final String value; // labelに対する値（例: Dart）
  final Color color;
  const ItemDetailContentCard({
    super.key,
    required this.assetPath,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Sizes.p12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: context.colorScheme.outline)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.p4),
            child: Material(
              // Containerでcolorを設定するとSVGにも色が適応される
              color: color,
              child: Padding(
                padding: const EdgeInsets.all(Sizes.p8),
                child: SvgPicture.asset(
                  assetPath,
                  height: Sizes.p24,
                  width: Sizes.p24,
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
            ),
          ),
          gapW8,
          Text(label, style: appTextTheme.bodyMedium),
          const Spacer(),
          Text(value, style: appTextTheme.labelSmall)
        ],
      ),
    );
  }
}
