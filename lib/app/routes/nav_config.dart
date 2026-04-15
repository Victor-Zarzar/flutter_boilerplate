import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/routes/app_route.dart';
import 'package:flutter_boilerplate/app/routes/nav_destination.dart';

class NavConfig {
  NavConfig._();

  static const List<NavDestination> items = [
    NavDestination(
      route: AppRoute.home,
      icon: Icons.home_outlined,
      labelKey: 'home',
    ),
    NavDestination(
      route: AppRoute.dashboard,
      icon: Icons.dashboard,
      labelKey: 'dashboard',
    ),
    NavDestination(
      route: AppRoute.settings,
      icon: Icons.settings_outlined,
      labelKey: 'settings',
    ),
  ];

  static const List<NavDestination> mobile = items;
  static const List<NavDestination> desktop = items;
}
