import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/shared/theme/app_theme.dart';
import 'package:flutter_boilerplate/app/shared/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UiProvider>(
      builder: (context, notifier, child) {
        return Scaffold(
          backgroundColor: notifier.isDark
              ? BackGroundColor.fourthColor
              : BackGroundColor.primaryColor,
          appBar: AppBar(
            title: Text("home".tr()),
            centerTitle: true,
            backgroundColor: notifier.isDark
                ? AppBarColor.thirdColor
                : AppBarColor.secondaryColor,
          ),
          body: Center(child: Text("home".tr())),
        );
      },
    );
  }
}
