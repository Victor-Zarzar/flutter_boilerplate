import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/routes/app_route.dart';

class NavDestination {
  const NavDestination({
    required this.route,
    required this.icon,
    required this.labelKey,
  });

  final AppRoute route;
  final IconData icon;
  final String labelKey;
}
