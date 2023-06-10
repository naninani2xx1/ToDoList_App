import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_list/export.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: TextApp('TODOLISt'),
          ),
          ButtonApp(
            text: 'Loggout',
            onPressed: () {
              FirebaseAuth.instance.signOut();
              GoRouter.of(context).go(AppRoutes.login.path);
            },
          )
        ],
      ),
    );
  }
}
