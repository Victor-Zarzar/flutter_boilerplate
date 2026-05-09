import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/shared/extensions/context_extension.dart';
import 'package:flutter_boilerplate/app/shared/theme/app_borders.dart';
import 'package:flutter_boilerplate/app/shared/theme/app_spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeActionCard extends StatelessWidget {
  const HomeActionCard({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.theme.textTheme;

    return InkWell(
      borderRadius: AppBorders.lg,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppSpacing.lg.w),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: AppBorders.lg,
          border: Border.all(color: colorScheme.outlineVariant),
        ),
        child: Row(
          children: [
            Icon(icon, size: 32.sp, color: colorScheme.primary),
            SizedBox(width: AppSpacing.md.w),
            Expanded(
              child: Text(
                label,
                style: textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
