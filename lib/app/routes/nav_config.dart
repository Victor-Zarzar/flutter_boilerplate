import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/routes/app_route.dart';
import 'package:flutter_boilerplate/app/routes/nav_destination.dart';

class NavConfig {
  NavConfig._();

  static const List<NavDestination> items = [
    NavDestination(route: AppRoute.home, icon: Icons.calculate),
    NavDestination(route: AppRoute.about, icon: Icons.info),
    NavDestination(route: AppRoute.settings, icon: Icons.settings),
  ];

  static const List<NavDestination> mobile = items;
  static const List<NavDestination> desktop = items;
}
