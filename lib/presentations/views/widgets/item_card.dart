import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/constants/app_sizes.dart';
import 'package:yumemi_flutter_codecheck/domain/models/item_model.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/app_image.dart';
import 'package:yumemi_flutter_codecheck/themes/app_text_theme.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final void Function() onTap;
  const ItemCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.p12,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: AppImage(
                    path: item.owner.avatarUrl,
                    type: ImageType.url,
                    height: 24,
                  ),
                ),
                gapW8,
                Text(
                  item.name,
                  style: appTextTheme.labelLarge,
                ),
              ],
            ),
            gapH8,
            Text(
              item.description ?? '-',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
