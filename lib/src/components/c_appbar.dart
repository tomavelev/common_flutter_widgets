// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import 'platform/get_platform.dart';
// import 'platform/platform_wrapper.dart';

// PreferredSizeWidget CAppBar({
//   Widget? leading,
//   Widget? title,
//   List<Widget> actions = const <Widget>[],
// }) {
//   if (platform() == PlatformWrapper.ios ||
//       platform() == PlatformWrapper.macos) {
//     return CupertinoNavigationBar(
//       leading: leading,
//       middle: title,
//       trailing: _actions(actions),
//     );
//   }
//   return AppBar(
//     leading: leading,
//     title: title,
//     actions: actions,
//   );
// }

// Widget? _actions(List<Widget> actions) {
//   if (actions.isEmpty) return null;
//   if (actions.length == 1) {
//     return actions[0];
//   }
//   return Row(
//     children: actions,
//   );
// }
