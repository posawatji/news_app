import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/provider/is_device_not_connected_to_any_network_provider.dart';

void main() {
  late ProviderContainer container;

  setUpAll(() {
    container = ProviderContainer();
  });
  tearDownAll(() {
    container.dispose();
  });
  test('isDeviceNotConnectedToAnyNetworkProvider initializes with false', () {
    // Read the provider value
    final bool isDeviceNotConnectedToAnyNetwork = container.read(isDeviceNotConnectedToAnyNetworkProvider);

    // Assert the initial state
    expect(isDeviceNotConnectedToAnyNetwork, isFalse);
  });

  test('isDeviceNotConnectedToAnyNetworkProvider can be updated', () {
    // Create a StateController to update the provider's state
    final StateController<bool> controller = container.read(isDeviceNotConnectedToAnyNetworkProvider.notifier);

    // Update the provider's state
    controller.state = true;

    // Read the updated provider value
    final bool isDeviceNotConnectedToAnyNetwork = container.read(isDeviceNotConnectedToAnyNetworkProvider);

    // Assert the updated state
    expect(isDeviceNotConnectedToAnyNetwork, isTrue);
  });
}
