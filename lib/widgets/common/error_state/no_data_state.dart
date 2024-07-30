import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NoDataState extends HookConsumerWidget {
  const NoDataState({
    super.key,
    this.icon,
    this.title,
    this.errorMessage,
  });

  final IconData? icon;
  final String? title;
  final String? errorMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: icon != null,
          child: Icon(
            icon,
            size: 64,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title ?? 'No Data',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Visibility(
          visible: errorMessage != null,
          child: Text(
            errorMessage ?? 'Please Try Again Later',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
