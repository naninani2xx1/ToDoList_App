import 'package:to_do_list/export.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PAGE NOT FOUND'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'ERROR PAGE',
              style: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
