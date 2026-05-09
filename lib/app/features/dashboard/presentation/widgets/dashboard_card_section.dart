import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/shared/extensions/context_extension.dart';
import 'package:flutter_boilerplate/app/shared/theme/app_spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardSection extends StatelessWidget {
  const DashboardSection({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w800,
            color: colorScheme.onSurface,
            fontSize: 18.sp,
          ),
        ),
        SizedBox(height: AppSpacing.md.h),
        child,
      ],
    );
  }
}
