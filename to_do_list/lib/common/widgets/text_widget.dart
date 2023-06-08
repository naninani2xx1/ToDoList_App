import 'package:to_do_list/export.dart';

class TextApp extends StatelessWidget {
  const TextApp(
    this.text, {
    super.key,
    this.textColor = blackColor,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 14.0,
    this.height,
  });

  final String text;

  final Color textColor;

  final FontWeight fontWeight;

  final double fontSize;

  final double? height;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: FontFamily.dmSans,
        color: textColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
        height: height,
      ),
    );
  }
}
