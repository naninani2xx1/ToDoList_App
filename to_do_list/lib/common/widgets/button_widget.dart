import 'package:to_do_list/export.dart';

class ButtonApp extends StatelessWidget {
  const ButtonApp({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 14.0,
    this.backgroundColor = primaryColor,
    this.textColor = whiteColor,
    required this.onPressed,
  });
  //
  final String text;

  final FontWeight? fontWeight;

  final double fontSize;

  final Color backgroundColor;

  final Color textColor;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
        elevation: const MaterialStatePropertyAll(4.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: FontFamily.dmSans,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: textColor,
        ),
      ),
    );
  }
}
