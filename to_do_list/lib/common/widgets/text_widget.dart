import 'package:to_do_list/export.dart';

class TextApp extends StatelessWidget {
  const TextApp(
    this.text, {
    super.key,
    this.textColor = blackColor,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 14.0,
    this.height,
    this.textAlign = TextAlign.left,
    this.maxLines,
  });

  final String text;

  final Color textColor;

  final FontWeight fontWeight;

  final double fontSize;

  final double? height;

  final TextAlign textAlign;

  final int? maxLines;
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
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
    );
  }
}
