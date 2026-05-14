import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/shared/extensions/context_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppCachedImage extends StatelessWidget {
  final String imageUrl;

  final double? width;

  final double? height;

  final BoxFit fit;

  final Widget? placeholder;

  final Widget? errorWidget;

  final Color? color;

  final BlendMode? colorBlendMode;

  final BorderRadius? borderRadius;

  final Duration? fadeInDuration;

  final Alignment alignment;

  final bool useSkeleton;

  final String? cacheKey;

  const AppCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.color,
    this.colorBlendMode,
    this.borderRadius,
    this.fadeInDuration,
    this.alignment = Alignment.center,
    this.useSkeleton = true,
    this.cacheKey,
  });

  @override
  Widget build(BuildContext context) {
    final double? adjustedWidth = width?.w;
    final double? adjustedHeight = height?.h;

    Widget imageContent = CachedNetworkImage(
      imageUrl: imageUrl,
      cacheKey: cacheKey,
      width: adjustedWidth,
      height: adjustedHeight,
      fit: fit,
      color: color,
      colorBlendMode: colorBlendMode,
      alignment: alignment,
      fadeInDuration: fadeInDuration ?? const Duration(milliseconds: 500),
      placeholder: (context, url) =>
          placeholder ?? _buildDefaultPlaceholder(context),
      errorWidget: (context, url, error) =>
          errorWidget ?? _buildDefaultErrorWidget(context),
    );

    if (borderRadius != null) {
      imageContent = ClipRRect(
        borderRadius: borderRadius!,
        child: imageContent,
      );
    }

    return imageContent;
  }

  Widget _buildDefaultPlaceholder(BuildContext context) {
    if (useSkeleton) {
      return Skeletonizer(
        enabled: true,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surfaceContainerHighest,
            borderRadius: borderRadius,
          ),
        ),
      );
    }
    return _buildLoadingIndicator(context);
  }

  Widget _buildLoadingIndicator(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: context.theme.colorScheme.surfaceContainerHighest.withValues(
        alpha: 0.9,
      ),
      child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
    );
  }

  Widget _buildDefaultErrorWidget(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: context.theme.colorScheme.errorContainer.withValues(alpha: 0.9),
      child: Center(
        child: Icon(
          Icons.broken_image_outlined,
          color: context.theme.colorScheme.error,
        ),
      ),
    );
  }
}
