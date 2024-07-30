import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  static const String routeName = 'LoadingDialog';

  static const keys = (loading_dialog: Key('loading_dialog'));

  static Future<void> show(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      routeSettings: const RouteSettings(name: routeName),
      context: context,
      builder: (BuildContext context) {
        return LoadingDialog(key: keys.loading_dialog);
      },
    );
  }

  static void close(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
