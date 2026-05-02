import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

class LocalizationWrapper extends StatelessWidget {
  final Widget child;

  const LocalizationWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('es'), Locale('pt')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: child,
    );
  }
}
