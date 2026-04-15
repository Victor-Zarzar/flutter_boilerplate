import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:flutter_boilerplate/app/shared/theme/app_theme.dart';
import 'package:flutter_boilerplate/app/shared/theme/theme_provider.dart';
import 'package:flutter_boilerplate/app/shared/theme/typography_extension.dart';
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
            centerTitle: true,
            title: Text("home".tr(), style: context.h1),
            backgroundColor: notifier.isDark
                ? AppBarColor.thirdColor
                : AppBarColor.secondaryColor,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("welcome".tr(), style: context.h1),
                const SizedBox(height: 8),
                Text("home_subtitle".tr(), style: context.h2),
                const SizedBox(height: 20),
                Text("quick_actions".tr(), style: context.h2),
                const SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: _HomeActionCard(
                        icon: Icons.analytics_outlined,
                        label: "view_metrics".tr(),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DashboardPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _HomeActionCard(
                        icon: Icons.settings_outlined,
                        label: "settings".tr(),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                Text("overview".tr(), style: context.h2),
                const SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: _MiniStatCard(title: "projects".tr(), value: "12"),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _MiniStatCard(title: "tasks".tr(), value: "28"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _HomeActionCard extends StatelessWidget {
  const _HomeActionCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ui = context.watch<UiProvider>();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ui.isDark
              ? AppBarColor.thirdColor
              : AppBarColor.secondaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: IconColor.primaryColor),
            const SizedBox(height: 10),
            Text(label, style: context.h2),
          ],
        ),
      ),
    );
  }
}

class _MiniStatCard extends StatelessWidget {
  const _MiniStatCard({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final ui = context.watch<UiProvider>();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ui.isDark ? AppBarColor.thirdColor : AppBarColor.secondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(title, style: context.h2),
          const SizedBox(height: 8),
          Text(value, style: context.h1),
        ],
      ),
    );
  }
}
