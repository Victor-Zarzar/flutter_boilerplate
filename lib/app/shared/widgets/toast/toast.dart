import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/app/shared/widgets/toast/raw_toast.dart';

enum ToastPosition { top, bottom }

int gapBetweenCard = 15;

double calculatePosition(List<ToastBar> toastBars, ToastBar self) {
  if (toastBars.isNotEmpty && self != toastBars.last) {
    final box = self.info.key.currentContext?.findRenderObject() as RenderBox?;
    if (box != null) {
      return gapBetweenCard * (toastBars.length - toastBars.indexOf(self) - 1);
    }
  }
  return 0;
}

double calculateScaleFactor(List<ToastBar> toastBars, ToastBar current) {
  final int index = toastBars.indexOf(current);
  final int indexValFromLast = toastBars.length - 1 - index;
  final double factor = indexValFromLast / 25;
  final double res = 0.97 - factor;
  return res < 0 ? 0 : res;
}

List<ToastBar> _toastBars = [];

class ToastBar {
  final Duration toastDuration;

  final ToastPosition position;

  final bool autoDismiss;

  final WidgetBuilder builder;

  final Duration animationDuration;

  final Curve? animationCurve;

  late final SnackBarInfo info;

  ToastBar({
    this.toastDuration = const Duration(milliseconds: 5000),
    this.position = ToastPosition.bottom,
    required this.builder,
    this.animationDuration = const Duration(milliseconds: 700),
    this.autoDismiss = false,
    this.animationCurve,
  }) : assert(toastDuration.inMilliseconds > animationDuration.inMilliseconds);

  void remove() {
    info.entry.remove();
    _toastBars.removeWhere((element) => element == this);
  }

  void show(BuildContext context) {
    final OverlayState overlayState = Navigator.of(context).overlay!;
    info = SnackBarInfo(
      key: GlobalKey<RawToastState>(),
      createdAt: DateTime.now(),
    );
    info.entry = OverlayEntry(
      builder: (_) => RawToast(
        key: info.key,
        animationDuration: animationDuration,
        toastPosition: position,
        animationCurve: animationCurve,
        autoDismiss: autoDismiss,
        getPosition: () => calculatePosition(_toastBars, this),
        getscaleFactor: () => calculateScaleFactor(_toastBars, this),
        snackbarDuration: toastDuration,
        onRemove: remove,
        child: builder.call(context),
      ),
    );

    _toastBars.add(this);
    overlayState.insert(info.entry);
  }

  static void removeAll() {
    for (int i = 0; i < _toastBars.length; i++) {
      _toastBars[i].info.entry.remove();
    }
    _toastBars.removeWhere((element) => true);
  }
}

class SnackBarInfo {
  late final OverlayEntry entry;
  final GlobalKey<RawToastState> key;
  final DateTime createdAt;

  SnackBarInfo({required this.key, required this.createdAt});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SnackBarInfo &&
        other.entry == entry &&
        other.key == key &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => entry.hashCode ^ key.hashCode ^ createdAt.hashCode;
}

extension Cleaner on List<ToastBar> {
  List<ToastBar> clean() {
    return where((element) => element.info.key.currentState != null).toList();
  }
}
