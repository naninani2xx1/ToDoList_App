import 'package:to_do_list/export.dart';

class ButtonAuthGoogle extends StatelessWidget {
  const ButtonAuthGoogle({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 82.0,
            color: blurColor.withOpacity(0.5),
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(
              vertical: paddingSize / 2,
              horizontal: paddingSize - 7,
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(backgroundColor),
          elevation: MaterialStatePropertyAll(0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Image.asset(
                'assets/img/google.png',
                fit: BoxFit.scaleDown,
              ),
            ),
            const SizedBox(width: 8.0),
            TextApp(
              'Sign in with Google'.toUpperCase(),
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              textColor: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
