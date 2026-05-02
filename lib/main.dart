import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/shared/services/sentry_service.dart';
import 'package:flutter_boilerplate/app/shared/wrapper/localization_wrapper.dart';
import 'package:flutter_boilerplate/app/shared/wrapper/state_wrapper.dart';
import 'package:flutter_boilerplate/app_widget.dart';
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

  runApp(const LocalizationWrapper(child: StateWrapper(child: AppWidget())));
}
