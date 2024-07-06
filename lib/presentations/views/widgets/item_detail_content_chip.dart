import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumemi_flutter_codecheck/constants/app_sizes.dart';

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
        ),
        gapW8,
        Text(value),
      ],
    );
  }
}
