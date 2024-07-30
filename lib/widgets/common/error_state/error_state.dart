import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorState extends HookConsumerWidget {
  const ErrorState({
    super.key,
    this.icon,
    this.title,
    this.errorMessage,
  });

  final IconData? icon;
  final String? title;
  final String? errorMessage;

  static Widget noInternetConnectionError() {
    return const ErrorState(
      icon: Icons.wifi_off,
      title: 'No Internet Connection',
      errorMessage: 'Please Check Your Internet Connection and Try Again Later.',
    );
  }

  static Widget serverError() {
    return const ErrorState(
      icon: Icons.error,
      title: 'Server Error',
      errorMessage: 'Please Try Again Later.',
    );
  }

  static Widget unknownError() {
    return const ErrorState(
      icon: Icons.error,
      title: 'Unknown Error',
      errorMessage: 'Please Try Again Later.',
    );
  }

  // 'You have exceeded the MONTHLY\n quota for Requests on your current'
  // 'You have exceeded the rate limit per second for your plan, BASIC, by the API provide',
  static Widget rateLimitError(String? errorMessage) {
    return ErrorState(
      icon: Icons.error,
      title: 'Rate Limit Error',
      errorMessage: errorMessage,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon ?? Icons.error,
            size: 64,
            color: Colors.black,
          ),
          const SizedBox(height: 16),
          Text(
            title ?? 'Something Went Wrong',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            errorMessage ?? 'Please Try Again Later.',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
