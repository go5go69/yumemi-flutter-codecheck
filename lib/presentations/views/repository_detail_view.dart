import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_codecheck/presentations/views/widgets/view_template.dart';

class RepositoryDetailView extends ConsumerWidget {
  const RepositoryDetailView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ViewTemplate.primary(
      appBar: AppBar(),
      body: const Text('this is repository detail view.'),
    );
  }
}
