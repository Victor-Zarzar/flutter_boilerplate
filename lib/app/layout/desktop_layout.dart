import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/routes/app_router_extension.dart';
import 'package:flutter_boilerplate/app/routes/nav_config.dart';
import 'package:go_router/go_router.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, required this.child});

  final Widget child;

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    final index = NavConfig.desktop.indexWhere(
      (item) => item.route.path == location,
    );

    return index >= 0 ? index : 0;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _currentIndex(context);

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: currentIndex,

            onDestinationSelected: (index) {
              context.goTo(NavConfig.desktop[index].route);
            },

            labelType: NavigationRailLabelType.all,

            destinations: NavConfig.desktop.map((item) {
              return NavigationRailDestination(
                icon: Icon(item.icon),
                label: Text(item.labelKey.tr()),
              );
            }).toList(),
          ),

          const VerticalDivider(width: 1),

          Expanded(child: child),
        ],
      ),
    );
  }
}
