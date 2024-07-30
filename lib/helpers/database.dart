import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

abstract class Database {
  Database._();

  /// hive
  ///
  /// Ref. https://pub.dev/packages/hive
  ///
  static late LazyBox db;

  ///
  /// log
  static _forceLog(String message) => log(message, name: 'Database');

  /// Initialized status
  ///
  static bool _isInitialized = false;

  /// Initializing
  ///
  static Future<void> initialize({String? encryptionKey}) async {
    if (_isInitialized) {
      _forceLog('Already initialized.');
      return;
    }
    _forceLog('Initializing...');
    await Hive.initFlutter();

    db = await Hive.openLazyBox('db');

    _isInitialized = true;
    _forceLog('Initializing is completed.');
  }

  /// Write
  ///
  static Future<void> write(String key, dynamic value) async {
    await db.put(key, value);
  }

  /// Read
  ///
  static Future<dynamic> read(String key) async {
    final value = await db.get(key);

    return value;
  }

  /// Delete
  ///
  static Future<void> delete(String key) async {
    await db.delete(key);
  }

  /// Clear
  ///
  static Future<void> clear() async {
    await db.clear();
  }
}
