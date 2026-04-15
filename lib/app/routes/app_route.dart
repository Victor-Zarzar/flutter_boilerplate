enum AppRoute {
  home('/', 'home'),
  dashboard('/dashboard', 'dashboard'),
  settings('/settings', 'settings');

  const AppRoute(this.path, this.name);

  final String path;
  final String name;
}
