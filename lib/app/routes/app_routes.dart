import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/app/shared/widgets/responsive.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String home = '/';
  static const String about = '/about';
  static const String settings = '/settings';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Respsonsive(
            mobile: MobileLayout(child: child),
            tablet: MobileLayout(child: child),
            desktop: DesktopLayout(child: child),
          );
        },
        routes: [
          GoRoute(
            path: home,
            name: 'home',
            pageBuilder: (context, state) =>
                NoTransitionPage(key: state.pageKey, child: const HomePage()),
          ),
          GoRoute(
            path: about,
            name: 'about',
            pageBuilder: (context, state) =>
                NoTransitionPage(key: state.pageKey, child: const AboutPage()),
          ),
          GoRoute(
            path: settings,
            name: 'settings',
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: kIsWeb
                  ? const SettingsPageDesktop()
                  : const SettingsPage(),
            ),
          ),
        ],
      ),
    ],
  );
}
