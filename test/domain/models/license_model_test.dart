import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/domain/models/license_model.dart';

import '../../mock/github_response_json.dart';

void main() {
  // jsonデータはpostmanより引用し、itemプロパティの1つ目のlicenseプロパティを使用
  // 実際の値
  test(
    'license model fromJson Test',
    () {
      final items = githubResponseJsonMock['items'] as List<dynamic>;
      final firstItem = items[0] as Map<String, dynamic>;
      final license = firstItem['license'] as Map<String, dynamic>;

      final licenseModel = License.fromJson(license);

      expect(licenseModel.key, equals('bsd-3-clause'));
      expect(
        licenseModel.name,
        equals('BSD 3-Clause "New" or "Revised" License'),
      );
      expect(licenseModel.spdxId, equals('BSD-3-Clause'));
      expect(
        licenseModel.url,
        equals('https://api.github.com/licenses/bsd-3-clause'),
      );
      expect(licenseModel.nodeId, equals('MDc6TGljZW5zZTU='));
    },
  );
}
