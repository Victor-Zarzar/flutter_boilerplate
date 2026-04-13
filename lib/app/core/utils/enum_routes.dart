enum AppRoute {
  home('/', 'home'),
  about('/about', 'about'),
  settings('/settings', 'settings');

  const AppRoute(this.path, this.name);
  final String path;
  final String name;
}
