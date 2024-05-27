import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform/get_platform.dart';

class CElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const CElevatedButton({
    super.key,
    this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (isApple()) {
      return CupertinoButton.filled(onPressed: onPressed, child: child);
    }

    return ElevatedButton(onPressed: onPressed, child: child);
  }
}