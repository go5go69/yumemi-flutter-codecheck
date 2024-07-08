import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_codecheck/domain/models/item_model.dart';

part 'selected_item_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedItemNotifier extends _$SelectedItemNotifier {
  @override
  Item? build() {
    return null;
  }

  /// state更新メソッド
  void updateState(Item item) => state = item;

  /// test用にstateをリターン
  Item? debugState() {
    return state;
  }
}
