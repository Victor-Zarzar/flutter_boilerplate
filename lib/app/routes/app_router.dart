import 'package:flutter_boilerplate/app/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:flutter_boilerplate/app/features/home/presentation/pages/home_page.dart';
import 'package:flutter_boilerplate/app/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter_boilerplate/app/layout/desktop_layout.dart';
import 'package:flutter_boilerplate/app/layout/mobile_layout.dart';
import 'package:flutter_boilerplate/app/routes/app_routes.dart';
import 'package:flutter_boilerplate/app/routes/global_navigation.dart';
import 'package:flutter_boilerplate/app/shared/wrapper/responsive_wrapper.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.home,
  routes: <RouteBase>[
    ShellRoute(
      builder: (context, state, child) {
        final location = state.uri.path;
        return ResponsiveWrapper(
          mobile: MobileLayout(location: location, child: child),
          tablet: MobileLayout(location: location, child: child),
          desktop: DesktopLayout(location: location, child: child),
        );
      },
      routes: [
        GoRoute(
          path: AppRoutes.home,
          name: AppRoutes.home,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const HomePage(),
            );
          },
        ),
        GoRoute(
          path: AppRoutes.dashboard,
          name: AppRoutes.dashboard,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const DashboardPage(),
            );
          },
        ),
        GoRoute(
          path: AppRoutes.settings,
          name: AppRoutes.settings,
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
