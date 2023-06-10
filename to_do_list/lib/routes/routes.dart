/// Represents the app routes and their paths.
enum AppRoutes {
  introduction(
    name: 'introduction',
    path: '/introduction',
  ),
  login(
    name: 'login',
    path: '/login',
  ),

  signUp(
    name: 'signUp',
    path: '/signUp',
  ),

  checkYourEmail(
    name: 'checkYourEmail',
    path: 'checkYourEmail',
  ),

  dashboard(
    name: 'dashboard',
    path: '/dashboard',
  ),

  forgotPassword(
    name: 'forgotPassword',
    path: '/forgotPassword',
  );

  const AppRoutes({
    required this.name,
    required this.path,
  });

  final String name;

  final String path;

  @override
  String toString() => name;
}
