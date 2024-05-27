import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform/get_platform.dart';

Page page<T>(final Widget child) {
  if (isApple()) {
    return CupertinoPage<T>(child: child);
  }
  return MaterialPage<T>(child: child);
}
