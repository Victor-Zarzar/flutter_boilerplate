import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/presentation/viewmodels/theme_viewmodel.dart';
import 'package:flutter_boilerplate/app/shared/extensions/context_extension.dart';
import 'package:flutter_boilerplate/app/shared/theme/app_borders.dart';
import 'package:flutter_boilerplate/app/shared/theme/app_spacing.dart';
import 'package:flutter_boilerplate/app/shared/widgets/app_top_bar.dart';
import 'package:flutter_boilerplate/app/shared/wrapper/responsive_wrapper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppTopBar(title: 'select_theme'.tr(), showBackButton: true),
      body: const ResponsiveWrapper(
        mobile: _ThemeContent(maxContentWidth: 420),
        tablet: _ThemeContent(maxContentWidth: 560),
        desktop: _ThemeContent(maxContentWidth: 720),
      ),
    );
  }
}

class _ThemeContent extends StatelessWidget {
  const _ThemeContent({required this.maxContentWidth});

  final double maxContentWidth;

  @override
  Widget build(BuildContext context) {
    final currentTheme = context.watch<ThemeViewModel>().themeMode;
    final themeVm = context.read<ThemeViewModel>();

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxContentWidth),
        child: ListView(
          padding: EdgeInsets.all(AppSpacing.xl.w),
          children: [
            _ThemeInfoCard(
              icon: Icons.devices_outlined,
              title: 'system_theme'.tr(),
              subtitle: 'system_theme_description'.tr(),
              selected: currentTheme == ThemeMode.system,
              onTap: () => themeVm.changeTheme(ThemeMode.system),
            ),
            SizedBox(height: AppSpacing.md.h),
            _ThemeInfoCard(
              icon: Icons.light_mode_outlined,
              title: 'light_theme'.tr(),
              subtitle: 'light_theme_description'.tr(),
              selected: currentTheme == ThemeMode.light,
              onTap: () => themeVm.changeTheme(ThemeMode.light),
            ),
            SizedBox(height: AppSpacing.md.h),
            _ThemeInfoCard(
              icon: Icons.dark_mode_outlined,
              title: 'dark_theme'.tr(),
              subtitle: 'dark_theme_description'.tr(),
              selected: currentTheme == ThemeMode.dark,
              onTap: () => themeVm.changeTheme(ThemeMode.dark),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeInfoCard extends StatelessWidget {
  const _ThemeInfoCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.theme.textTheme;

    return InkWell(
      borderRadius: AppBorders.card,
      onTap: onTap,
      child: Ink(
        padding: EdgeInsets.all(AppSpacing.lg.w),
        decoration: BoxDecoration(
          color: selected
              ? colorScheme.primaryContainer.withValues(alpha: 0.28)
              : colorScheme.surfaceContainerHighest,
          borderRadius: AppBorders.card,
          border: Border.all(
            color: selected ? colorScheme.primary : colorScheme.outlineVariant,
            width: selected ? 1.6 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: colorScheme.primary, size: 28.sp),
            SizedBox(width: AppSpacing.md.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w800,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: AppSpacing.xs.h),
                  Text(
                    subtitle,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontSize: 13.sp,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            if (selected)
              Icon(Icons.check_circle, color: colorScheme.primary, size: 24.sp),
          ],
        ),
      ),
    );
  }
}
