import 'package:to_do_list/routes/export_router.dart';
import 'package:to_do_list/src/ui/check_email/check_your_email_screen.dart';
import 'package:to_do_list/src/ui/dashboard/dashboard_screen.dart';
import 'package:to_do_list/utils/slide_trasition_type.dart';

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
      GoRoute(
        path: AppRoutes.signUp.path,
        name: AppRoutes.signUp.name,
        pageBuilder: (context, state) {
          return FadeTransitionRoute(
            pageKey: state.pageKey,
            child: const SignUpScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.forgotPassword.path,
        name: AppRoutes.forgotPassword.name,
        pageBuilder: (context, state) {
          return SlideTransitionPage(
            typeSlide: SlideTransitionType.right,
            pageKey: state.pageKey,
            child: const ForgotPasswordScreen(),
          );
        },
        routes: [
          GoRoute(
            path: AppRoutes.checkYourEmail.path,
            name: AppRoutes.checkYourEmail.name,
            pageBuilder: (context, state) {
              return FadeTransitionRoute(
                pageKey: state.pageKey,
                child: const CheckYourEmailScreen(),
              );
            },
          ),
        ],
      ),
      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return Scaffold(
            backgroundColor: backgroundColor,
            body: child,
            /* ... */
          );
        },
        routes: [
          GoRoute(
            path: AppRoutes.dashboard.path,
            name: AppRoutes.dashboard.name,
            pageBuilder: (context, state) {
              return FadeTransitionRoute(
                pageKey: state.pageKey,
                child: const DashboardScreen(),
              );
            },
          ),
        ],
      )
    ],
  );
}
