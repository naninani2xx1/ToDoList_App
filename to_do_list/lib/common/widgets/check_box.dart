import 'package:to_do_list/export.dart';

class CheckBoxApp extends StatefulWidget {
  const CheckBoxApp({super.key, required this.onChanged});
  final OnChangeValueBox onChanged;
  @override
  State<CheckBoxApp> createState() => _CheckBoxAppState();
}

class _CheckBoxAppState extends State<CheckBoxApp> {
  late ValueNotifier<bool> _checkedNotifier;
  @override
  void initState() {
    super.initState();
    _checkedNotifier = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    _checkedNotifier.dispose();
    super.dispose();
  }

  final size = 24.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _checkedNotifier.value = !_checkedNotifier.value;
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: _checkedNotifier,
        builder: (context, bool isChecked, child) {
          return Container(
              width: size,
              height: size,
              decoration: const BoxDecoration(
                color: checkBoxColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius / 3),
                ),
              ),
              child: isChecked
                  ? const Icon(
                      Icons.check,
                      size: 15.0,
                      color: textColor,
                    )
                  : null);
        },
      ),
    );
  }
}
