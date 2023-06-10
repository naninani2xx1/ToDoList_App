import 'package:to_do_list/export.dart';
import 'package:to_do_list/utils/form_logic/form_logic_mixin.dart';

class TextFieldApp extends StatefulWidget {
  const TextFieldApp(
      {super.key,
      required this.onChanged,
      required this.title,
      required this.keyboardType,
      required this.textInputAction, required this.hintText});
  final OnChangeValueForm onChanged;

  final String title;

  final TextInputType keyboardType;

  final TextInputAction textInputAction;

  final String hintText;
  @override
  State<TextFieldApp> createState() => _TextFieldAppState();
}

class _TextFieldAppState extends State<TextFieldApp> with FormLogicMixin {
  @override
  void initState() {
    super.initState();
    onChangedText();
  }

  @override
  void dispose() {
    destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(
          widget.title,
          fontSize: 12.0,
          textColor: textColor,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 10.0),
        Container(
          clipBehavior: Clip.none,
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: blurColor.withOpacity(0.2), // Màu của boxShadow
                // Bán kính mở rộng boxShadow
                blurRadius: 62, // Bán kính mờ boxShadow
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ValueListenableBuilder(
              valueListenable: clearValueNotifier,
              builder: (context, bool isClear, Widget? child) {
                return TextFormField(
                  controller: controller,
                  cursorColor: primaryColor,
                  style: TextStyle(
                    fontFamily: FontFamily.dmSans,
                    fontSize: 12.0,
                    color: textFormColor,
                    fontWeight: FontWeight.w400,
                  ),
                  keyboardType: widget.keyboardType,
                  textInputAction: widget.textInputAction,
                  onChanged: widget.onChanged,
                  decoration: inputDecoration.copyWith(
                    suffixIcon: isClear
                        ? GestureDetector(
                            onTap: clearHandler,
                            child: SvgPicture.asset(
                              AssetSvg.circleClearSvg,
                              fit: BoxFit.scaleDown,
                            ),
                          )
                        : null,
                    hintText: 'Enter the Email',
                    hintStyle: TextStyle(
                      fontFamily: FontFamily.dmSans,
                      fontSize: 12.0,
                      color: textFormColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
