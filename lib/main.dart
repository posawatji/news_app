import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';
import 'helpers/database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Database.initialize();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
