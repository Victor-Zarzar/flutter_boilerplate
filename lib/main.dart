import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/app/presentation/viewmodels/locale_viewmodel.dart';
import 'package:flutter_boilerplate/app/presentation/viewmodels/notification_viewmodel.dart';
import 'package:flutter_boilerplate/app/shared/services/sentry_service.dart';
import 'package:flutter_boilerplate/app/shared/theme/theme_provider.dart';
import 'package:flutter_boilerplate/app_widget.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest_10y.dart' as tz;
import 'package:flutter_boilerplate/app/shared/services/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  if (!kIsWeb) {
    await NotificationService.init();
    tz.initializeTimeZones();
  }

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    SentryService.instance.captureException(
      details.exception,
      stackTrace: details.stack,
    );
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    SentryService.instance.captureException(error, stackTrace: stack);
    return true;
  };

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
        Locale('es'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en-US'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<NotificationViewModel>(
            create: (_) => NotificationViewModel(),
          ),
          ChangeNotifierProvider<LocaleViewModel>(
            create: (_) => LocaleViewModel(),
          ),
          ChangeNotifierProvider<UiProvider>(
            create: (_) => UiProvider()..init(),
          ),
        ],
        child: const AppWidget(),
      ),
    ),
  );
}
