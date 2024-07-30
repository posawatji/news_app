import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.boxFit = BoxFit.cover,
    this.errorWidget,
  });

  final String imageUrl;
  final BoxFit boxFit;
  final Widget Function(BuildContext, String, Object)? errorWidget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      errorWidget: errorWidget ??
          (context, url, error) {
            return Container(
              color: Colors.black54,
              child: const Icon(Icons.error, color: Colors.white),
            );
          },
    );
  }
}
