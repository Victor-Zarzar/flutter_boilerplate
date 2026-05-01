import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/routes/app_router_extension.dart';
import 'package:flutter_boilerplate/app/routes/nav_config.dart';
import 'package:flutter_boilerplate/app/shared/theme/app_theme.dart';
import 'package:flutter_boilerplate/app/shared/theme/theme_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
    final uiProvider = context.watch<UiProvider>();

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        backgroundColor: uiProvider.isDark
            ? TabBarColor.fourthColor
            : TabBarColor.thirdColor,
        indicatorColor: uiProvider.isDark
            ? TabBarColor.fifthColor
            : TabBarColor.secondaryColor,
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          context.goTo(NavConfig.mobile[index].route);
        },
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(color: TextColor.primaryColor);
          }
          return TextStyle(color: TextColor.primaryColor);
        }),
        destinations: NavConfig.mobile.map((item) {
          return NavigationDestination(
            icon: Icon(item.icon, color: IconColor.primaryColor),
            label: item.labelKey.tr(),
          );
        }).toList(),
      ),
    );
  }
}
