import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/shared/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_boilerplate/app/routes/app_router.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UiProvider>(
      builder: (context, uiProvider, _) {
        return MaterialApp.router(
          title: 'Flutter Boilerplate',
          debugShowCheckedModeBanner: false,
          theme: uiProvider.lightTheme,
          darkTheme: uiProvider.darkTheme,
          themeMode: uiProvider.isDark ? ThemeMode.dark : ThemeMode.light,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
