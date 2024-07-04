// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/flavors.dart';
import 'package:yumemi_flutter_codecheck/pages/my_home_page.dart';

void main() {
  // 仮のテストです
  testWidgets('MyHomePage has a title and message',
      (WidgetTester tester) async {
    // テスト用のウィジェットツリーを作成
    await tester.pumpWidget(MaterialApp(home: MyHomePage()));

    // AppBarのタイトルを探す
    expect(find.text(F.title), findsOneWidget);

    // Bodyのメッセージを探す
    expect(find.text('Hello ${F.title}'), findsOneWidget);
  });
}
