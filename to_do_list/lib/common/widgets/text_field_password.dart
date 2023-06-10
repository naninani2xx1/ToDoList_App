import 'package:to_do_list/export.dart';
import 'package:to_do_list/utils/form_logic/form_logic_mixin.dart';

class TextFieldPassword extends StatefulWidget {
  const TextFieldPassword({super.key, required this.onChanged});
  final OnChangeValueForm onChanged;
  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword>
    with FormLogicMixin {
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
        const TextApp(
          'Password',
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
              valueListenable: visibilityNotifier,
              builder: (context, bool isVisibility, Widget? child) {
                return TextFormField(
                  controller: controller,
                  obscureText: !isVisibility,
                  cursorColor: primaryColor,
                  style: TextStyle(
                    fontFamily: FontFamily.dmSans,
                    fontSize: 12.0,
                    color: textFormColor,
                    fontWeight: FontWeight.w400,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onChanged: widget.onChanged,
                  decoration: inputDecoration.copyWith(
                    suffixIcon: !isVisibility
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: paddingSize / 2),
                            child: GestureDetector(
                              onTap: visibilityHandler,
                              child: SvgPicture.asset(
                                AssetSvg.visibilityOnSvg,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: paddingSize / 2),
                            child: GestureDetector(
                              onTap: visibilityHandler,
                              child: SvgPicture.asset(
                                AssetSvg.visibilityOffSvg,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                    hintText: 'Password',
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
