import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../hooks/use_connectivity_hook.dart';
import '../news_discovery_page/news_discovery_page.dart';
import '../news_saved_items_page/news_saved_items_page.dart';

class LandingPage extends HookConsumerWidget {
  const LandingPage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useConnectivityHook(context, ref);
    final pageController = usePageController();
    final currentBottomNavigatorBarIndex = useState<int>(0);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                NewsDiscoveryPage(),
                NewsSavedItemsPage(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentBottomNavigatorBarIndex.value,
        onDestinationSelected: (index) {
          currentBottomNavigatorBarIndex.value = index;
          pageController.jumpToPage(index);
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.newspaper),
            icon: Icon(Icons.newspaper_outlined),
            label: 'News',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_outline),
            label: 'Saved',
          ),
        ],
      ),
    );
  }
}
