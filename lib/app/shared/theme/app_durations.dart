abstract final class AppDurations {
  AppDurations._();
  static const Duration instant = Duration(milliseconds: 50);
  static const Duration veryFast = Duration(milliseconds: 100);
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration quick = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration medium = Duration(milliseconds: 400);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration verySlow = Duration(milliseconds: 700);
  static const Duration shimmer = Duration(milliseconds: 1000);
  static const Duration pageTransition = medium;
  static const Duration widgetTransition = normal;
  static const Duration microInteraction = fast;
}
