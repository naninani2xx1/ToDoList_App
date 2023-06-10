import 'dart:async';

import 'package:to_do_list/common/widgets/toast_widget.dart';
import 'package:to_do_list/export.dart';

enum ToastType {
  success,
  error,
}

class FlutterToast {
  FlutterToast._();

  static bool _isShow = false;

  static late OverlayEntry _overlayEntry;

  static void showToast(BuildContext context, String message,
      {int timer = 2, ToastType toastType = ToastType.success}) {
    if (_isShow) {
      return;
    }

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        bottom: 14,
        left: 14,
        right: 14,
        child: Material(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          child: ToastWidget(
            message: message,
            toastType: toastType,
            onDissmiss: _onDissmiss,
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry);

    _isShow = !_isShow;

    // Wait for 2 seconds
    Future.delayed(Duration(seconds: timer), _onDissmiss);
  }

  static void _onDissmiss() {
    if (_isShow) {
      _isShow = !_isShow;
      _overlayEntry.remove();
    }
  }
}
