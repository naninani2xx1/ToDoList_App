import 'package:flutter/foundation.dart';
import 'package:to_do_list/common/route_transitions/fade_in.dart';
import 'package:to_do_list/export.dart';
import 'package:to_do_list/src/ui/error/error_ui.dart';
import 'package:to_do_list/src/ui/introduction/introduction_screen.dart';
import 'package:to_do_list/src/ui/login/login_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.introduction.path,
    debugLogDiagnostics: kDebugMode,
    errorBuilder: (context, state) => const ErrorScreen(),
    routes: [
      GoRoute(
        path: AppRoutes.introduction.path,
        name: AppRoutes.introduction.name,
        pageBuilder: (context, state) {
          return FadeTransitionRoute(
            pageKey: state.pageKey,
            child: const IntroductionScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.login.path,
        name: AppRoutes.login.name,
        pageBuilder: (context, state) {
          return FadeTransitionRoute(
            pageKey: state.pageKey,
            child: const LoginScreen(),
          );
        },
      ),
    ],
  );
}
