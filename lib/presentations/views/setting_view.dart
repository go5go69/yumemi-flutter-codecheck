import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/view_template.dart';

class SettingView extends ConsumerWidget {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ViewTemplate.primary(
      body: const Center(child: Text('coming soon')),
    );
  }
}
