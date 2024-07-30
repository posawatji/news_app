import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../models/news_item_model/news_item_model.dart';
import '../../provider/is_device_not_connected_to_any_network_provider.dart';
import '../common/button/news_saved_button.dart';
import '../common/error_state/error_state.dart';

class NewsDetailPageArguments {
  NewsDetailPageArguments({required this.news});

  final NewsItemModel news;
}

class NewsDetailPage extends HookConsumerWidget {
  const NewsDetailPage({super.key});

  static const routeName = '/news_detail_page';

  static Future<void> show(
    BuildContext context, {
    required NewsDetailPageArguments args,
  }) async {
    await Navigator.of(context).pushNamed(routeName, arguments: args);
  }

  static void close(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)?.settings.arguments as NewsDetailPageArguments?;

    final controller = useMemoized(() => WebViewController(), []);
    final loadProgress = useState<int>(0);

    useEffect(() {
      if (args == null) return () {};

      controller
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(Colors.white)
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              if (context.mounted) {
                loadProgress.value = progress;
              }
            },
          ),
        )
        ..loadRequest(Uri.parse(args.news.newsUrl));

      return () {};
    }, []);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple.shade50,
        title: Column(
          children: [
            Text(
              args?.news.title ?? '',
              style: Theme.of(context).textTheme.labelLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        leadingWidth: 56,
        leading: IconButton(
          onPressed: () {
            close(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 24,
            color: Colors.black,
          ),
        ),
        actions: [
          NewsSavedButton(
            news: args?.news ?? const NewsItemModel(),
            size: 56,
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: HookBuilder(builder: (_) {
              if (!ref.watch(isDeviceNotConnectedToAnyNetworkProvider)) {
                return ErrorState.noInternetConnectionError();
              }

              if (args == null || args.news.newsUrl.isEmpty) {
                return const ErrorState();
              }

              return WebViewWidget(controller: controller);
            }),
          ),
          Visibility(
            visible: loadProgress.value > 0 && loadProgress.value < 100,
            child: LinearProgressIndicator(
              value: loadProgress.value / 100,
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }
}
