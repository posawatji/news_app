import 'package:flutter/material.dart';

abstract class AppSnackBar {
  const AppSnackBar._();

  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
        ),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.down,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        backgroundColor: Colors.deepPurple.shade200,
      ),
    );
  }

  static void showNoConnection(BuildContext context) {
    show(
      context,
      'No Internet Connection, Please Check Your Internet Connection.',
    );
  }

  static void showSavedOrUnsavedError(BuildContext context) {
    show(
      context,
      "Something Wrong Can't Saved/Unsaved News This Time, Please Try Again!",
    );
  }

  static void showClearCacheError(BuildContext context) {
    show(
      context,
      "Something Wrong Can't Clear Cache, Please Try Again!",
    );
  }
}
