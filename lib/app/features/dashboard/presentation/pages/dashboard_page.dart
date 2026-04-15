import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/shared/theme/app_theme.dart';
import 'package:flutter_boilerplate/app/shared/theme/theme_provider.dart';
import 'package:flutter_boilerplate/app/shared/theme/typography_extension.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final double myHeight = MediaQuery.of(context).size.height;
    final double myWidth = MediaQuery.of(context).size.width;

    return Consumer<UiProvider>(
      builder: (context, notifier, child) {
        return Scaffold(
          backgroundColor: notifier.isDark
              ? BackGroundColor.fourthColor
              : BackGroundColor.primaryColor,
          body: SizedBox(
            height: myHeight,
            width: myWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: myWidth,
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    backgroundColor: notifier.isDark
                        ? AppBarColor.thirdColor
                        : AppBarColor.secondaryColor,
                    title: Text('dashboard'.tr(), style: context.h1),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _DashboardSection(
                          title: 'overview'.tr(),
                          child: Row(
                            children: [
                              Expanded(
                                child: _DashboardCard(
                                  icon: Icons.analytics_outlined,
                                  title: 'projects'.tr(),
                                  value: '12',
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _DashboardCard(
                                  icon: Icons.task_alt_outlined,
                                  title: 'tasks'.tr(),
                                  value: '28',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        _DashboardSection(
                          title: 'performance'.tr(),
                          child: Row(
                            children: [
                              Expanded(
                                child: _DashboardCard(
                                  icon: Icons.speed_outlined,
                                  title: 'productivity'.tr(),
                                  value: '87%',
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _DashboardCard(
                                  icon: Icons.timer_outlined,
                                  title: 'focus_time'.tr(),
                                  value: '6h 40m',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        _DashboardSection(
                          title: 'summary'.tr(),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: notifier.isDark
                                  ? AppBarColor.thirdColor
                                  : AppBarColor.secondaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.insights_outlined,
                                  color: IconColor.primaryColor,
                                  semanticLabel: 'dashboard_summary_icon'.tr(),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    'dashboard_description'.tr(),
                                    style: context.h2,
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DashboardSection extends StatelessWidget {
  const _DashboardSection({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.h2),
        const SizedBox(height: 10),
        child,
      ],
    );
  }
}

class _DashboardCard extends StatelessWidget {
  const _DashboardCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final uiProvider = context.watch<UiProvider>();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: uiProvider.isDark
            ? AppBarColor.thirdColor
            : AppBarColor.secondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: IconColor.primaryColor, semanticLabel: title),
          const SizedBox(height: 12),
          Text(title, style: context.h2),
          const SizedBox(height: 8),
          Text(value, style: context.h1),
        ],
      ),
    );
  }
}
