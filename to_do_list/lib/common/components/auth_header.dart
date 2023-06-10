import 'package:to_do_list/export.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: paddingSize + 8),
      child: LimitedBox(
        maxHeight: 100.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextApp(
                title,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                textColor: primaryColor,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: TextApp(
                subTitle,
                fontSize: 12.0,
                textColor: textColor,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
