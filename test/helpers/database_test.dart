import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/helpers/database.dart';

import '../mockers/mock_path_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    mockPathProvider();
  });

  group('Database', () {
    test('Initialize Database', () async {
      await Database.initialize();

      expect(Database.db, isA<LazyBox>());

      await Database.initialize();

      expect(Database.db, isA<LazyBox>());
    });

    test('Write and Read Data', () async {
      await Database.write('testKey', 'Hello, Hive!');

      final value = await Database.read('testKey');

      expect(value, 'Hello, Hive!');
    });

    test('Delete Data', () async {
      await Database.write('testKey', 'Hello, Hive!');
      await Database.delete('testKey');

      final value = await Database.read('testKey');

      expect(value, isNull);
    });

    test('Clear All Data', () async {
      await Database.write('key1', 'Value1');
      await Database.write('key2', 'Value2');

      await Database.clear();

      final value1 = await Database.read('key1');
      final value2 = await Database.read('key2');

      expect(value1, isNull);
      expect(value2, isNull);
    });
  });
}
