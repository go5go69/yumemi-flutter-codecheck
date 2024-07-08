import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/domain/models/request_param_model.dart';

void main() {
  test('RequestParam toJson method test', () {
    // テストデータの作成
    final param = RequestParam(
      q: 'flutter',
      sort: 'stars',
      order: 'desc',
      perPage: 50,
      page: 2,
    );

    // 期待されるJSONマップ
    final expectedJson = {
      'q': 'flutter',
      'sort': 'stars',
      'order': 'desc',
      'perPage': 50,
      'page': 2,
    };

    // toJsonメソッドを呼び出し、結果を検証
    expect(param.toJson(), expectedJson);
  });

  test('RequestParam toJson with default values', () {
    // デフォルト値を利用したテストデータの作成
    final param = RequestParam(
      q: 'flutter',
    );

    // 期待されるJSONマップ（デフォルト値を含む）
    final expectedJson = {
      'q': 'flutter',
      'sort': null,
      'order': null,
      'perPage': 30,
      'page': 1,
    };

    // toJsonメソッドを呼び出し、結果を検証
    expect(param.toJson(), expectedJson);
  });
}
