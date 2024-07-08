import 'package:flutter/material.dart';

class AppDialog {
  AppDialog._();

  static Future<bool?> indicator(BuildContext context) async {
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 300),
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (context, _, __) {
        return const Center(
          child: CircularProgressIndicator.adaptive(
            backgroundColor: Colors.white,
          ),
        );
      },
    );
  }
}
