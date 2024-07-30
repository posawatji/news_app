import 'package:flutter/material.dart';

import 'widgets/landing_page/landing_page.dart';
import 'widgets/news_detail_page/news_detail_page.dart';
import 'widgets/news_discovery_page/news_discovery_page.dart';
import 'widgets/news_saved_items_page/news_saved_items_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: LandingPage.routeName,
      routes: {
        LandingPage.routeName: (context) => const LandingPage(),
        NewsDiscoveryPage.routeName: (context) => const NewsDiscoveryPage(),
        NewsSavedItemsPage.routeName: (context) => const NewsSavedItemsPage(),
        NewsDetailPage.routeName: (context) => const NewsDetailPage(),
      },
    );
  }
}
