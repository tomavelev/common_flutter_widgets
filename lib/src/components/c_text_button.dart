import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform/get_platform.dart';

class CTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const CTextButton({
    super.key,
    this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (isApple()) {
      return CupertinoButton(onPressed: onPressed, child: child);
    }

    return TextButton(onPressed: onPressed, child: child);
  }
  
}