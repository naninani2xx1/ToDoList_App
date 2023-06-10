// ignore_for_file: use_build_context_synchronously

import 'package:to_do_list/export.dart';
import 'package:to_do_list/src/ui/login/export_login.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Builder(builder: (context) {
          return BlocListener<AuthCubit, AuthState>(
            listener: (context, state) async {
              if (state is AuthLoading) {
                FlutterLoading.show(context);
              }

              if (state is Authenticated) {
                FlutterLoading.onDissmiss();

                FlutterToast.showToast(context, 'Sign up account successfully');
                await Future.delayed(const Duration(seconds: 2), () {
                  GoRouter.of(context).goNamed(AppRoutes.login.name);
                });
              }

              if (state is AuthenticateError) {
                // loading turn off
                FlutterLoading.onDissmiss();
                FlutterToast.showToast(context, state.message);
              }
            },
            child: Scaffold(
              backgroundColor: backgroundColor,
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: paddingSize),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AuthHeader(
                        title: 'Create an Account',
                        subTitle:
                            'Elevate your productivity game - Where all jobs and activities become a breeze with ToDoList!',
                      ),
                      const SizedBox(height: 30),
                      TextFieldApp(
                        hintText: 'Enter the name',
                        title: 'Full name',
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        onChanged: (text) =>
                            context.read<AuthCubit>().onChangedFullname(text),
                      ),
                      const SizedBox(height: 15.0),
                      TextFieldApp(
                        hintText: 'Enter the email',
                        title: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onChanged: (text) =>
                            context.read<AuthCubit>().onChangedEmail(text),
                      ),
                      const SizedBox(height: 15.0),
                      TextFieldPassword(
                        onChanged: (text) =>
                            context.read<AuthCubit>().onChangedPassword(text),
                      ),
                      const SizedBox(height: 20.0),
                      LimitedBox(
                        maxHeight: 24.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CheckBoxApp(
                              onChanged: (value) {},
                            ),
                            const SizedBox(width: 15.0),
                            const TextApp(
                              'Remember me',
                              fontSize: 12.0,
                              textColor: textDisable,
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () => GoRouter.of(context)
                                  .push(AppRoutes.forgotPassword.path),
                              child: const TextApp(
                                'Forgot Password ?',
                                fontSize: 12.0,
                                textColor: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 266.0,
                            minHeight: heightButton,
                          ),
                          child: BlocBuilder<AuthCubit, AuthState>(
                            buildWhen: (p, c) {
                              if (c is AuthInitial && p is AuthInitial) {
                                if (c.emailAddress != p.emailAddress ||
                                    c.fullname != p.fullname ||
                                    c.password != p.password) {
                                  return true;
                                }
                              }
                              return false;
                            },
                            builder: (context, state) {
                              return ButtonApp(
                                text: 'SIGN UP',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.5,
                                onPressed: () =>
                                    _handleValidate(state, context),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 266.0,
                            maxHeight: heightButton,
                            minHeight: heightButton - 1,
                          ),
                          child: ButtonAuthGoogle(
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              GoRouter.of(context).go(AppRoutes.login.path);
                            },
                            child: const Text.rich(
                              TextSpan(
                                text: 'You don\'t have an account yet? ',
                                style: TextStyle(
                                  fontFamily: FontFamily.dmSans,
                                  fontSize: 12.0,
                                  color: textColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Sign in',
                                    style: TextStyle(
                                      fontFamily: FontFamily.dmSans,
                                      fontSize: 12.0,
                                      color: secondaryColor,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void _handleValidate(AuthState state, BuildContext context) {
    if (state is AuthInitial) {
      if (!(state.emailAddress.isValidEmail)) {
        FlutterToast.showToast(context, 'Email is not valid', timer: 3);
        return;
      }
      if (state.password.length < 10) {
        FlutterToast.showToast(context, 'Password is too short', timer: 3);
        return;
      }
    }
    context.read<AuthCubit>().submitSignUp();
  }
}
