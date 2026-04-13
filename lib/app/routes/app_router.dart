import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/layout/desktop_layout.dart';
import 'package:flutter_boilerplate/app/layout/mobile_layout.dart';
import 'package:flutter_boilerplate/app/routes/app_route.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_boilerplate/app/shared/widgets/responsive.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoute.home.path,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Responsive(
            mobile: MobileLayout(child: child),
            tablet: MobileLayout(child: child),
            desktop: DesktopLayout(child: child),
          );
        },
        routes: [
          GoRoute(
            path: AppRoute.home.path,
            name: AppRoute.home.name,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: const HomePage(),
              );
            },
          ),
          GoRoute(
            path: AppRoute.about.path,
            name: AppRoute.about.name,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: const AboutPage(),
              );
            },
          ),
          GoRoute(
            path: AppRoute.settings.path,
            name: AppRoute.settings.name,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: const SettingsPage(),
              );
            },
          ),
        ],
      ),
    ],
  );
}
