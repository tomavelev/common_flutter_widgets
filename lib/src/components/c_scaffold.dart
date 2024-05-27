import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/menu_item.dart';
import 'platform/get_platform.dart';

class CScaffold extends StatelessWidget {
  final Widget body;

  // final PreferredSizeWidget? appBar;
  final List<CMenuItem> menuItems;
  final List<Widget> menuRoutes;
  final Function(String)? onTap;
  final Widget? fab;
  final Widget? title;

  const CScaffold({
    super.key,
    required this.body,
    // this.appBar,
    this.menuRoutes = const <Widget>[],
    this.menuItems = const <CMenuItem>[],
    this.onTap,
    this.fab,
    this.title,
  });

  @override
  Widget build(BuildContext context) => isApple()
      ? _appleScaffold()
      : Scaffold(
          appBar: title != null
              ? AppBar(
                  title: title,
                )
              : null,
          body: body,
          floatingActionButton: fab,
          // appBar: appBar ?? AppBar(),
          drawer: menuItems.isNotEmpty
              ? Drawer(
                  child: ListView.builder(
                    itemBuilder: (context, index) => ListTile(
                      onTap: () => onTap?.call(menuItems[index].url),
                      title: Text(menuItems[index].title),
                      leading: menuItems[index].icon,
                    ),
                    itemCount: menuItems.length,
                  ),
                )
              : null,
        );

  Widget _appleScaffold() {
    if (menuItems.isNotEmpty) {
      return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            items: menuItems
                .map((e) => BottomNavigationBarItem(
                      icon: e.icon,
                      label: e.title,
                    ))
                .toList()),
        tabBuilder: (context, index) => CupertinoPageScaffold(
          // navigationBar: appBar as ObstructingPreferredSizeWidget,
          child: menuRoutes[index],
        ),
      );
    }
    return CupertinoPageScaffold(
      navigationBar: fab == null && title == null
          ? null
          : CupertinoNavigationBar(
              middle: title,
              trailing: fab,
            ),
      child: body,
    );
  }
}
