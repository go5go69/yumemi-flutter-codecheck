import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/app_image.dart';

void main() {
  group('AppImage Widget Tests', () {
    const assetPath = 'assets/images/code.svg';
    const networkPath = 'https://placehold.jp/150x150.png';
    const double height = 100.0;
    const double width = 100.0;
    const BoxFit fit = BoxFit.cover;

    testWidgets(
      'renders asset image correctly',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppImage(
                path: assetPath,
                type: ImageType.asset,
                height: height,
                width: width,
                fit: fit,
              ),
            ),
          ),
        );

        final imageFinder = find.byType(Image);
        expect(imageFinder, findsOneWidget);

        final imageWidget = tester.widget<Image>(imageFinder);
        expect(imageWidget.image, isA<AssetImage>());
        final assetImage = imageWidget.image as AssetImage;
        expect(assetImage.assetName, assetPath);
        expect(imageWidget.height, height);
        expect(imageWidget.width, width);
        expect(imageWidget.fit, fit);
      },
    );

    testWidgets(
      'renders network image correctly',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppImage(
                path: networkPath,
                type: ImageType.url,
                height: height,
                width: width,
                fit: fit,
              ),
            ),
          ),
        );

        final imageFinder = find.byType(Image);
        expect(imageFinder, findsOneWidget);

        final imageWidget = tester.widget<Image>(imageFinder);
        expect(imageWidget.image, isA<NetworkImage>());
        final networkImage = imageWidget.image as NetworkImage;
        expect(networkImage.url, networkPath);
        expect(imageWidget.height, height);
        expect(imageWidget.width, width);
        expect(imageWidget.fit, fit);
      },
    );

    testWidgets(
      'renders error widget when asset image fails to load',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppImage(
                path: 'error_path.png',
                type: ImageType.asset,
                height: height,
                width: width,
              ),
            ),
          ),
        );

        // 画像のエラーをトリガーするために必要
        await tester.pumpAndSettle();

        final errorContainerFinder = find.byType(Container);
        expect(errorContainerFinder, findsOneWidget);

        final errorIconFinder = find.byType(Icon);
        expect(errorIconFinder, findsOneWidget);

        final iconWidget = tester.widget<Icon>(errorIconFinder);
        expect(iconWidget.icon, Icons.broken_image);
        expect(iconWidget.color, Colors.grey);
        expect(iconWidget.size, width / 2);
      },
    );

    testWidgets(
      'renders error widget when network image fails to load',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppImage(
                path: 'error_path.png',
                type: ImageType.url,
                height: height,
                width: width,
              ),
            ),
          ),
        );

        // 画像のエラーをトリガーするために必要
        await tester.pumpAndSettle();

        final errorContainerFinder = find.byType(Container);
        expect(errorContainerFinder, findsOneWidget);

        final errorIconFinder = find.byType(Icon);
        expect(errorIconFinder, findsOneWidget);

        final iconWidget = tester.widget<Icon>(errorIconFinder);
        expect(iconWidget.icon, Icons.broken_image);
        expect(iconWidget.color, Colors.grey);
        expect(iconWidget.size, width / 2);
      },
    );
  });
}
