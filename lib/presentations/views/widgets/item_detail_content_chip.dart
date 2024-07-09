import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumemi_flutter_codecheck/constants/app_sizes.dart';
import 'package:yumemi_flutter_codecheck/extensions/build_context_extension.dart';

// TODO: <MID> enum化して、値に対応するlabelなどを管理するようにするか検討

/// リポジトリの詳細をコンパクトに表示
class ItemDetailContentChip extends StatelessWidget {
  final String assetPath;
  final String value;
  const ItemDetailContentChip({
    super.key,
    required this.assetPath,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          assetPath,
          height: Sizes.p16,
          // ignore: deprecated_member_use
          color: context.colorScheme.primary,
        ),
        gapW8,
        Text(value),
      ],
    );
  }
}
