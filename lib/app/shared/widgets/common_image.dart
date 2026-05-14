import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/shared/widgets/app_cached_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CommonImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BorderRadius? borderRadius;

  const CommonImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.color,
    this.placeholder,
    this.errorWidget,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final double? adjustedWidth = width?.w;
    final double? adjustedHeight = height?.h;

    Widget image;

    if (imageUrl.startsWith('http')) {
      image = AppCachedImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        color: color,
        placeholder: placeholder,
        errorWidget: errorWidget,
        borderRadius: borderRadius,
      );
    } else if (imageUrl.endsWith('.svg')) {
      image = SvgPicture.asset(
        imageUrl,
        width: adjustedWidth,
        height: adjustedHeight,
        fit: fit,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
      );
    } else {
      image = Image.asset(
        imageUrl,
        width: adjustedWidth,
        height: adjustedHeight,
        fit: fit,
        color: color,
        errorBuilder: (context, error, stackTrace) =>
            errorWidget ?? _buildDefaultErrorWidget(),
      );
    }

    if (borderRadius != null) {
      return ClipRRect(borderRadius: borderRadius!, child: image);
    }

    return image;
  }

  Widget _buildDefaultErrorWidget() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[200],
      child: const Icon(Icons.error_outline, color: Colors.grey),
    );
  }
}
