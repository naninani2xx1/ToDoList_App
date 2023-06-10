import 'package:to_do_list/export.dart';

mixin FormLogicMixin {
  final ValueNotifier<bool> visibilityNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<bool> clearValueNotifier = ValueNotifier<bool>(false);
  final TextEditingController controller = TextEditingController();

  void onChangedText() {
    controller.addListener(_showClear);
  }

  void _showClear() {
    final text = controller.text;
    final isShow = clearValueNotifier.value;
    if (text.isHasValueForm(isShow)) {
      clearValueNotifier.value = true;
    } else if (text.isNotHasValueForm(isShow)) {
      clearValueNotifier.value = false;
    }
  }

  void clearHandler() {
    controller.clear();
    clearValueNotifier.value = false;
  }

  void visibilityHandler() {
    visibilityNotifier.value = !visibilityNotifier.value;
  }

  void destroy() {
    controller.dispose();
    visibilityNotifier.dispose();
    clearValueNotifier.dispose();
  }
}
