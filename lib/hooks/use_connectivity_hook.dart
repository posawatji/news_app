import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/is_device_not_connected_to_any_network_provider.dart';
import '../widgets/common/snack_bar/app_snack_bar.dart';
import 'use_after_first_layout.dart';

useConnectivityHook(BuildContext context, WidgetRef ref) {
  useAfterFirstLayout(
    (context) {
      Connectivity().onConnectivityChanged.listen((event) {
        if (event.contains(ConnectivityResult.none)) {
          ref.read(isDeviceNotConnectedToAnyNetworkProvider.notifier).state = false;
          AppSnackBar.showNoConnection(context);
        } else {
          ref.read(isDeviceNotConnectedToAnyNetworkProvider.notifier).state = true;
        }
      });
      return null;
    },
  );
}
