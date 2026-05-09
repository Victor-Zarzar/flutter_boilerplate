import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:flutter_boilerplate/app/features/dashboard/presentation/widgets/dashboard_card_section.dart';
import 'package:flutter_boilerplate/app/shared/extensions/context_extension.dart';
import 'package:flutter_boilerplate/app/shared/theme/app_borders.dart';
import 'package:flutter_boilerplate/app/shared/theme/app_spacing.dart';
import 'package:flutter_boilerplate/app/shared/widgets/app_top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppTopBar(title: 'dashboard'.tr()),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSpacing.xl.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DashboardSection(
                title: 'overview'.tr(),
                child: Row(
                  children: [
                    Expanded(
                      child: DashboardCard(
                        icon: Icons.analytics_outlined,
                        title: 'projects'.tr(),
                        value: '12',
                      ),
                    ),
                    SizedBox(width: AppSpacing.md.w),
                    Expanded(
                      child: DashboardCard(
                        icon: Icons.task_alt_outlined,
                        title: 'tasks'.tr(),
                        value: '28',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.xl.h),
              DashboardSection(
                title: 'performance'.tr(),
                child: Row(
                  children: [
                    Expanded(
                      child: DashboardCard(
                        icon: Icons.speed_outlined,
                        title: 'productivity'.tr(),
                        value: '87%',
                      ),
                    ),
                    SizedBox(width: AppSpacing.md.w),
                    Expanded(
                      child: DashboardCard(
                        icon: Icons.timer_outlined,
                        title: 'focus_time'.tr(),
                        value: '6h 40m',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.xl.h),
              DashboardSection(
                title: 'summary'.tr(),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(AppSpacing.lg.w),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: AppBorders.lg,
                    border: Border.all(color: colorScheme.outlineVariant),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.insights_outlined,
                        size: 28.sp,
                        color: colorScheme.primary,
                        semanticLabel: 'dashboard_summary_icon'.tr(),
                      ),
                      SizedBox(width: AppSpacing.md.w),
                      Expanded(
                        child: Text(
                          'dashboard_description'.tr(),
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontSize: 14.sp,
                            height: 1.5,
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
      ),
    );
  }
}
