abstract class Constants {
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: '',
  );

  static const String sentryDsn = String.fromEnvironment('SENTRY_DSN');

  static const String sentryEnv = String.fromEnvironment(
    'SENTRY_ENV',
    defaultValue: 'production',
  );
}
