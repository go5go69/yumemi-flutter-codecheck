import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/domain/models/github_response_model.dart';

import '../../mock/github_response_json.dart';

void main() {
  /// 最低限アプリ内で利用するプロパティをテスト
  test(
    'github response model fromJson Test',
    () {
      final json = githubResponseJsonMock;

      final result = GitHubResponse.fromJson(json);

      final firstItem = result.items.first;
      final firstItemOwner = firstItem.owner;

      final secondItem = result.items[1];

      // resultのプロパティを確認
      expect(result.totalCount, equals(710697));
      expect(result.items, hasLength(2));

      // result.item.firstのプロパティを確認
      expect(firstItem.name, equals('flutter'));
      expect(
        firstItem.description,
        equals(
            'Flutter makes it easy and fast to build beautiful apps for mobile and beyond'),
      );
      expect(firstItem.stargazersCount, equals(163134));
      expect(firstItem.forksCount, equals(26848));
      expect(firstItem.openIssuesCount, equals(12747));
      expect(firstItem.watchersCount, equals(163134));
      expect(firstItem.language, equals('Dart'));

      // result.item.first.ownerのプロパティを確認
      expect(firstItemOwner.login, equals('flutter'));
      expect(
        firstItemOwner.avatarUrl,
        equals('https://avatars.githubusercontent.com/u/14101776?v=4'),
      );

      // result.items[1]でnullであるプロパティを確認
      expect(secondItem.language, isNull);
      expect(secondItem.description, isNull);
    },
  );
}
