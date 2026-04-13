import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/core/utils/enum_routes.dart';
import 'nav_destination.dart';

class NavConfig {
  static const mobile = <NavDestination>[
    NavDestination(AppRoute.home, Icons.calculate),
    NavDestination(AppRoute.about, Icons.info),
    NavDestination(AppRoute.settings, Icons.settings),
  ];

  static const desktop = <NavDestination>[
    NavDestination(AppRoute.home, Icons.calculate),
    NavDestination(AppRoute.about, Icons.info),
    NavDestination(AppRoute.settings, Icons.settings),
  ];
}
