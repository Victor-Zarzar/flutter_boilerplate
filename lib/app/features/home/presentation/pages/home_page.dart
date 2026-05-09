import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/features/home/presentation/widgets/home_action_card.dart';
import 'package:flutter_boilerplate/app/features/home/presentation/widgets/home_stat_card.dart';
import 'package:flutter_boilerplate/app/routes/app_routes.dart';
import 'package:flutter_boilerplate/app/shared/extensions/context_extension.dart';
import 'package:flutter_boilerplate/app/shared/theme/app_spacing.dart';
import 'package:flutter_boilerplate/app/shared/widgets/app_top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppTopBar(title: 'home'.tr()),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(AppSpacing.xl.w),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'welcome'.tr(),
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: colorScheme.onSurface,
                        fontSize: 28.sp,
                      ),
                    ),
                    SizedBox(height: AppSpacing.sm.h),
                    Text(
                      'home_subtitle'.tr(),
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontSize: 14.sp,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: AppSpacing.xl.h),

                    Text(
                      'quick_actions'.tr(),
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: colorScheme.onSurface,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: AppSpacing.md.h),

                    HomeActionCard(
                      icon: Icons.analytics_outlined,
                      label: 'view_metrics'.tr(),
                      onTap: () {
                        context.go(AppRoutes.dashboard);
                      },
                    ),

                    SizedBox(height: AppSpacing.xl.h),

                    Text(
                      'overview'.tr(),
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: colorScheme.onSurface,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: AppSpacing.md.h),

                    Row(
                      children: [
                        Expanded(
                          child: MiniStatCard(
                            title: 'projects'.tr(),
                            value: '12',
                          ),
                        ),
                        SizedBox(width: AppSpacing.md.w),
                        Expanded(
                          child: MiniStatCard(title: 'tasks'.tr(), value: '28'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
