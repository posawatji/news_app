import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void mockPathProvider({
  String getApplicationDocumentsDirectory = '.',
  String getTemporaryDirectory = '.',
}) {
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
    const MethodChannel('plugins.flutter.io/path_provider'),
    (methodCall) async {
      if (methodCall.method == 'getApplicationDocumentsDirectory') return getApplicationDocumentsDirectory;
      if (methodCall.method == 'getTemporaryDirectory') return getTemporaryDirectory;
      return null;
    },
  );
}
