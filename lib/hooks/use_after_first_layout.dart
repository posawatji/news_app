import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Function that call when widget finish building.
///
/// * [effect] Callback to run when widget finish building.
///
/// That [effect] may optionally return a function, which will be called when the widget is disposed.
void useAfterFirstLayout(FutureOr<void Function()?> Function(BuildContext context) effect) {
  final context = useContext();

  useEffect(() {
    void Function()? disposer;

    WidgetsBinding.instance.endOfFrame.then(
      (_) async {
        if (context.mounted) disposer = await effect(context);
      },
    );

    return disposer;
  }, []);
}
