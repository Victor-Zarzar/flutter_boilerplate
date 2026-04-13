import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/app_widget.dart';
import 'package:flutter_boilerplate/app/shared/theme/theme_provider.dart';
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

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
        Locale('es'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<NotificationViewModel>(
            create: (_) => NotificationViewModel(),
          ),
          ChangeNotifierProvider<LocaleViewModel>(
            create: (_) => LocaleViewModel(),
          ),
          ChangeNotifierProvider<HomeViewModel>(create: (_) => HomeViewModel()),
          ChangeNotifierProvider<UiProvider>(
            create: (_) => UiProvider()..init(),
          ),
        ],
        child: const AppWidget(),
      ),
    ),
  );
}
