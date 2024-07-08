import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/constants/app_sizes.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/item_detail_content_card.dart';

void main() {
  group('ItemDetailContentCard Widget Tests', () {
    const assetPath = 'assets/images/code.svg';
    const label = 'Label';
    const value = 'Value';
    const color = Colors.red;

    testWidgets('renders correctly with given parameters',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ItemDetailContentCard(
              assetPath: assetPath,
              label: label,
              value: value,
              color: color,
            ),
          ),
        ),
      );

      // Containerのパディングとボーダーのスタイルを確認
      final container = tester.widget<Container>(find.byType(Container));
      final boxDecoration = container.decoration as BoxDecoration;
      expect(container.padding, const EdgeInsets.symmetric(vertical: 12.0));
      expect(
        boxDecoration.border?.bottom.color,
        Theme.of(tester.element(find.byType(Container))).colorScheme.outline,
      );

      // SvgPictureが表示されていることを確認
      expect(find.byType(SvgPicture), findsOneWidget);
      final svgPicture = tester.widget<SvgPicture>(find.byType(SvgPicture));
      expect(svgPicture.height, 24.0);
      expect(svgPicture.width, 24.0);

      // ClipRRectが設定されていることを確認
      expect(find.byType(ClipRRect), findsOneWidget);

      // ClipRRect内のMaterialウィジェットを確認
      // <caution>
      // SvgPictureにもMaterialウィジェットが利用されており特定ができないエラーが発生するため、
      // ClipRRectの子としてのMaterialウィジェットを探す。
      final clipRRectFinder = find.descendant(
          of: find.byType(ClipRRect), matching: find.byType(Material));
      expect(clipRRectFinder, findsOneWidget);
      final material = tester.widget<Material>(clipRRectFinder);
      expect(material.color, color);

      // テキストウィジェットが正しいラベルと値を表示していることを確認
      expect(find.text(label), findsOneWidget);
      expect(find.text(value), findsOneWidget);

      // Rowウィジェット内の子ウィジェットの配置を確認
      final row = tester.widget<Row>(find.byType(Row));
      expect(row.children.length, 5);
      expect(row.children[0], isA<ClipRRect>());
      expect(row.children[1], gapW8);
      expect(row.children[2], isA<Text>());
      expect(row.children[3], isA<Spacer>());
      expect(row.children[4], isA<Text>());
    });
  });
}
