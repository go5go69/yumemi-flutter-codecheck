import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/domain/models/owner_model.dart';

import '../../mock/github_response_json.dart';

void main() {
  // jsonデータはpostmanより引用し、itemプロパティの1つ目のownerプロパティを使用
  // 実際の値
  test(
    'owner model fromJson Test',
    () {
      final items = githubResponseJsonMock['items'] as List<dynamic>;
      final firstItem = items[0] as Map<String, dynamic>;
      final owner = firstItem['owner'] as Map<String, dynamic>;

      final ownerModel = Owner.fromJson(owner);

      expect(ownerModel.name, isNull);
      expect(ownerModel.email, isNull);
      expect(ownerModel.login, equals('flutter'));
      expect(ownerModel.id, equals(14101776));
      expect(ownerModel.nodeId, equals('MDEyOk9yZ2FuaXphdGlvbjE0MTAxNzc2'));
      expect(
        ownerModel.avatarUrl,
        equals('https://avatars.githubusercontent.com/u/14101776?v=4'),
      );
      expect(ownerModel.gravatarId, equals(''));
      expect(ownerModel.url, equals('https://api.github.com/users/flutter'));
      expect(ownerModel.htmlUrl, equals('https://github.com/flutter'));
      expect(
        ownerModel.followersUrl,
        equals('https://api.github.com/users/flutter/followers'),
      );
      expect(
        ownerModel.followingUrl,
        equals('https://api.github.com/users/flutter/following{/other_user}'),
      );
      expect(
        ownerModel.gistsUrl,
        equals('https://api.github.com/users/flutter/gists{/gist_id}'),
      );
      expect(
        ownerModel.starredUrl,
        equals('https://api.github.com/users/flutter/starred{/owner}{/repo}'),
      );
      expect(
        ownerModel.subscriptionsUrl,
        equals('https://api.github.com/users/flutter/subscriptions'),
      );
      expect(
        ownerModel.organizationsUrl,
        equals('https://api.github.com/users/flutter/orgs'),
      );
      expect(
        ownerModel.reposUrl,
        equals('https://api.github.com/users/flutter/repos'),
      );
      expect(
        ownerModel.eventsUrl,
        equals('https://api.github.com/users/flutter/events{/privacy}'),
      );
      expect(
        ownerModel.receivedEventsUrl,
        equals('https://api.github.com/users/flutter/received_events'),
      );
      expect(ownerModel.type, equals('Organization'));
      expect(ownerModel.siteAdmin, isFalse);
      expect(ownerModel.starredAt, isNull);
    },
  );
}
