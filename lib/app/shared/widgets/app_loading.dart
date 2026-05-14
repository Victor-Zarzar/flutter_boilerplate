import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/shared/extensions/context_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({
    super.key,
    this.message,
    this.size = 28,
    this.strokeWidth = 3,
  });

  final String? message;
  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth,
              color: cs.primary,
            ),
          ),
          if (message != null) ...[
            SizedBox(height: 16.h),
            Text(
              message!,
              style: context.theme.textTheme.bodyMedium?.copyWith(
                color: cs.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
