import 'package:flutter/cupertino.dart';

class ToButton extends StatelessWidget {
  const ToButton({
    super.key,
    required this.child,
    this.onPressed,
    this.borderRadius,
    this.color,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final BorderRadius? borderRadius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      borderRadius: borderRadius,
      color: color,
      minSize: 0,
      child: child,
    );
  }
}
