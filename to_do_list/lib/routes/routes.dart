/// Represents the app routes and their paths.
enum AppRoutes {
  introduction(
    name: 'introduction',
    path: '/introduction',
  ),
  login(
    name: 'login',
    path: '/login',
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
