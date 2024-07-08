import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/domain/models/item_model.dart';

import '../../mock/github_response_json.dart';

void main() {
  group(
    'item model fromJson Test',
    () {
      final items = githubResponseJsonMock['items'] as List<dynamic>;
      final firstItem = items[0] as Map<String, dynamic>;
      final secondItem = items[1] as Map<String, dynamic>;

      test(
        'actual response',
        () {
          final itemModel = Item.fromJson(firstItem);
          final ownerModel = itemModel.owner;

          expect(itemModel.name, equals('flutter'));
          expect(
            itemModel.description,
            equals(
                'Flutter makes it easy and fast to build beautiful apps for mobile and beyond'),
          );
          expect(itemModel.stargazersCount, equals(163134));
          expect(itemModel.forksCount, equals(26848));
          expect(itemModel.openIssuesCount, equals(12747));
          expect(itemModel.watchersCount, equals(163134));
          expect(itemModel.language, equals('Dart'));

          expect(ownerModel.login, equals('flutter'));
          expect(
            ownerModel.avatarUrl,
            equals('https://avatars.githubusercontent.com/u/14101776?v=4'),
          );
        },
      );

      // 実際の値から設定されていない可能性のある、description, languageをコメントアウト
      test(
        'not has value "description", "language"',
        () {
          final result = Item.fromJson(secondItem);

          expect(result.description, isNull);
          expect(result.language, isNull);
        },
      );
    },
  );
}
