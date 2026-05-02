import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/app/presentation/viewmodels/locale_viewmodel.dart';
import 'package:flutter_boilerplate/app/presentation/viewmodels/notification_viewmodel.dart';
import 'package:flutter_boilerplate/app/shared/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class StateWrapper extends StatelessWidget {
  final Widget child;

  const StateWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NotificationViewModel>(
          create: (_) => NotificationViewModel(),
        ),
        ChangeNotifierProvider<LocaleViewModel>(
          create: (_) => LocaleViewModel(),
        ),
        ChangeNotifierProvider<UiProvider>(create: (_) => UiProvider()),
      ],
      child: child,
    );
  }
}
