import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/constants/app_sizes.dart';
import 'package:yumemi_flutter_codecheck/domain/models/item_model.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/app_image.dart';
import 'package:yumemi_flutter_codecheck/themes/app_text_theme.dart';

/// リポジトリの概要を表示
class ItemCard extends StatelessWidget {
  final Item item;
  const ItemCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              // リポジトリオーナーのアイコン
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AppImage(
                  path: item.owner.avatarUrl,
                  type: ImageType.url,
                  height: Sizes.p24,
                  width: Sizes.p24,
                ),
              ),

              gapW8,

              // リポジトリオーナー名
              Text(
                item.owner.login,
                style: appTextTheme.bodyMedium,
              ),
            ],
          ),

          gapH8,
          // リポジトリ名
          Text(
            item.name,
            style: appTextTheme.labelLarge,
          ),

          gapH8,

          // リポジトリの説明（null許容）
          Text(
            item.description ?? '-',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
