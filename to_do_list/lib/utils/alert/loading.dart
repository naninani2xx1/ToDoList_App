import 'package:to_do_list/export.dart';

class FlutterLoading {
  FlutterLoading._();

  static bool _isShow = false;

  static late OverlayEntry _overlayEntry;

  static void show(BuildContext context) {
    if (_isShow) {
      return;
    }

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned.fill(
        child: Material(
          color: Colors.black54,
          borderRadius: const BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          child: FractionallySizedBox(
            widthFactor: 0.2,
            heightFactor: 0.2,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: whiteColor,
              ),
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry);

    _isShow = !_isShow;
  }

  static void onDissmiss() {
    if (_isShow) {
      _isShow = !_isShow;
      _overlayEntry.remove();
    }
  }
}
