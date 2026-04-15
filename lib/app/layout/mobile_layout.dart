import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/routes/app_router_extension.dart';
import 'package:flutter_boilerplate/app/routes/nav_config.dart';
import 'package:go_router/go_router.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key, required this.child});

  final Widget child;

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    final index = NavConfig.mobile.indexWhere(
      (item) => item.route.path == location,
    );

    return index >= 0 ? index : 0;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _currentIndex(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          context.goTo(NavConfig.mobile[index].route);
        },
        destinations: NavConfig.mobile.map((item) {
          return NavigationDestination(
            icon: Icon(item.icon),
            label: item.labelKey.tr(),
          );
        }).toList(),
      ),
    );
  }
}
