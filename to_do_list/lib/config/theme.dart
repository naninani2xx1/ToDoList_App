import 'package:to_do_list/export.dart';

final ThemeData theme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: backgroundColor,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  useMaterial3: false,
  primaryColor: primaryColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: backgroundColor,
  ),
  buttonTheme: const ButtonThemeData(
    height: heightButton,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius),
      ),
    ),
  ),
);

const _outlineInputForm = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: BorderRadius.all(
    Radius.circular(borderRadius * 2),
  ),
);

const inputDecoration = InputDecoration(
    filled: true,
    fillColor: whiteColor,
    constraints: BoxConstraints(
      minHeight: 50.0,
      maxHeight: 55.0,
    ),
    errorBorder: _outlineInputForm,
    enabledBorder: _outlineInputForm,
    focusedBorder: _outlineInputForm,
    border: _outlineInputForm);
