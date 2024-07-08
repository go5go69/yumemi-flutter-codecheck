import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/constants/app_sizes.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/item_detail_content_chip.dart';

void main() {
  group('ItemDetailContentChip Widget Tests', () {
    const assetPath = 'assets/images/code.svg';
    const value = 'Value';

    testWidgets(
      'renders correctly with given assetPath and value',
      (WidgetTester tester) async {
        // ウィジェットを構築
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: ItemDetailContentChip(
                assetPath: assetPath,
                value: value,
              ),
            ),
          ),
        );

        // SvgPictureが表示されていることを確認
        expect(find.byType(SvgPicture), findsOneWidget);
        final svgPicture = tester.widget<SvgPicture>(find.byType(SvgPicture));
        expect(svgPicture.height, 16.0);

        // テキストウィジェットが正しい値を表示していることを確認
        expect(find.text(value), findsOneWidget);
      },
    );

    testWidgets(
      'renders with correct spacing',
      (WidgetTester tester) async {
        // ウィジェットを構築
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: ItemDetailContentChip(
                assetPath: assetPath,
                value: value,
              ),
            ),
          ),
        );

        // Rowウィジェット内の子ウィジェットの配置を確認
        final row = tester.widget<Row>(find.byType(Row));
        expect(row.children.length, 3);
        expect(row.children[0], isA<SvgPicture>());
        expect(row.children[1], gapW8);
        expect(row.children[2], isA<Text>());
      },
    );
  });
}
