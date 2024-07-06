import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/constants/app_sizes.dart';

class AppImage extends StatelessWidget {
  final String path;
  final ImageType type;
  final double? height;
  final double? width;
  final BoxFit? fit;
  const AppImage({
    super.key,
    required this.path,
    required this.type,
    this.height,
    this.width,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return _imageWidget();
  }

  Widget _imageWidget() {
    switch (type) {
      case ImageType.asset:
        return Image.asset(
          path,
          height: height,
          width: width,
          fit: fit,
          errorBuilder: (context, object, stackTrace) {
            return _error();
          },
        );
      case ImageType.url:
        return Image.network(
          path,
          height: height,
          width: width,
          fit: fit,
          errorBuilder: (context, object, stackTrace) {
            return _error();
          },
        );
    }
  }

  Widget _error() {
    return Container(
      height: height,
      width: width,
      color: Colors.grey[300]!,
      child: Icon(
        Icons.broken_image,
        color: Colors.grey,
        size: (height == null && width == null)
            ? Sizes.p20
            : (height! >= width!)
                ? width! / 2
                : height! / 2,
      ),
    );
  }
}

/// AppImageWidget内で画像ファイルの存在場所を明確にするための引数として利用
/// - [asset] => アセットから画像を配置する場合
/// - [url] => インターネット上の画像を配置する場合
enum ImageType { asset, url }
