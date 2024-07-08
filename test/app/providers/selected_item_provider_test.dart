import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/app/providers/selected_item_provider.dart';
import 'package:yumemi_flutter_codecheck/domain/models/github_response_model.dart';

import '../../mock/github_response_json.dart';

void main() {
  group(
    'selected item provider Test',
    () {
      final testData = GitHubResponse.fromJson(githubResponseJsonMock);
      late ProviderContainer container;

      // 各テストの前に実行
      setUp(() {
        container = ProviderContainer();
      });

      // 各テストの後に実行
      tearDown(() {
        container.dispose();
      });

      test(
        'build test',
        () {
          final notifier =
              container.read(selectedItemNotifierProvider.notifier);
          notifier.build();

          expect(notifier.debugState(), equals(null));
        },
      );

      test(
        'update state method test',
        () {
          final notifier =
              container.read(selectedItemNotifierProvider.notifier);
          notifier.build();

          final first = notifier.debugState();

          notifier.updateState(testData.items[0]);

          // build後はnullであり、updateState()を行うと期待通りに更新されていることを確認
          expect(first, isNull);
          expect(notifier.debugState()!.id, equals(31792824));
        },
      );
    },
  );
}
