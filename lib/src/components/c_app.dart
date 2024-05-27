import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform/get_platform.dart';
import 'util/desktop_scroll_behaviour.dart';

class CApp extends StatelessWidget {
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Iterable<Locale> supportedLocales;
  final Widget? home;
  final ThemeData? theme;

  const CApp({
    super.key,
    this.supportedLocales = const <Locale>[
      Locale('en', 'US'),
    ],
    this.localizationsDelegates,
    this.home,
    this.theme,
  });

  @override
  Widget build(BuildContext context) {
    if (isApple()) {
      return CupertinoApp(
        supportedLocales: supportedLocales,
        localizationsDelegates: localizationsDelegates,
        home: home,
        theme: CupertinoThemeData.raw(
          theme?.brightness,
          theme?.primaryColor,
          null,
          null,
          null,
          null,
          null,
          // primaryContrastingColor,
          // textTheme,
          // barBackgroundColor,
          // scaffoldBackgroundColor,
          // applyThemeToAll,
        ),
      );
    }
    return MaterialApp(
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        home: home,
        theme: theme,
        scrollBehavior: DesktopMaterialScrollBehavior());
  }

  static Widget router({
    RouterConfig<Object>? routerConfig,
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    Iterable<Locale> supportedLocales = const <Locale>[
      Locale('en', 'US'),
    ],
  }) {
    if (isApple()) {
      CupertinoApp.router(
        routerConfig: routerConfig,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
      );
    }
    return MaterialApp.router(
      routerConfig: routerConfig,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
    );
  }
}
