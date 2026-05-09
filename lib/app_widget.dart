import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/presentation/viewmodels/theme_viewmodel.dart';
import 'package:flutter_boilerplate/app/routes/app_router.dart';
import 'package:flutter_boilerplate/app/shared/theme/theme.dart';
import 'package:flutter_boilerplate/app/shared/wrapper/responsive_wrapper.dart';
import 'package:flutter_boilerplate/app/shared/wrapper/skeleton_wrapper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeViewModel>(
      builder: (context, themeVm, _) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final designSize = ResponsiveWrapper.screenUtilDesignSize(context);
            return ScreenUtilInit(
              designSize: designSize,
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, _) {
                return MaterialApp.router(
                  title: 'Flutter Boilerplate',
                  debugShowCheckedModeBanner: false,
                  theme: buildLightTheme(primaryColorHex: '#669c35'),
                  darkTheme: buildDarkTheme(primaryColorHex: '#669c35'),
                  themeMode: themeVm.themeMode,
                  locale: context.locale,
                  supportedLocales: context.supportedLocales,
                  localizationsDelegates: context.localizationDelegates,
                  routerConfig: appRouter,
                  builder: (context, child) {
                    return SkeletonWrapper(child: child ?? const SizedBox());
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
