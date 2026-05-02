import 'package:flutter/widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonWrapper extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final bool enabled;

  final ShimmerEffect? effect;

  final bool enableSwitchAnimation;

  final SwitchAnimationConfig? switchAnimationConfig;

  final bool? justifyMultiLineText;

  final bool ignoreContainers;

  final Color? containersColor;

  final TextBoneBorderRadius? textBoneBorderRadius;

  final bool ignorePointers;

  const SkeletonWrapper({
    super.key,
    required this.child,
    this.isLoading = false,
    this.enabled = true,
    this.effect,
    this.enableSwitchAnimation = false,
    this.switchAnimationConfig,
    this.justifyMultiLineText,
    this.ignoreContainers = false,
    this.containersColor,
    this.textBoneBorderRadius,
    this.ignorePointers = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child;

    return Skeletonizer(
      enabled: isLoading,
      effect: effect,
      enableSwitchAnimation: enableSwitchAnimation,
      switchAnimationConfig: switchAnimationConfig,
      justifyMultiLineText: justifyMultiLineText,
      ignoreContainers: ignoreContainers,
      containersColor: containersColor,
      textBoneBorderRadius: textBoneBorderRadius,
      ignorePointers: ignorePointers,
      child: child,
    );
  }
}
