import 'package:to_do_list/core/observer/bloc.dart';
import 'package:to_do_list/export.dart';
import 'package:to_do_list/routes/router.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await configureDependencies();

  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());

  Future.delayed(const Duration(seconds: 2), () {
    FlutterNativeSplash.remove();
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      routerConfig: AppRouter.router,
      theme: theme,
      // routeInformationParser: AppRouter.router.routeInformationParser,
      // routerDelegate: AppRouter.router.routerDelegate,
      // routeInformationProvider: AppRouter.router.routeInformationProvider,
    );
  }
}
