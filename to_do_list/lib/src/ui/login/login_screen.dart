import 'package:to_do_list/export.dart';
import 'package:to_do_list/src/ui/login/export_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Builder(
          builder: (context) {
            return BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthLoading) {
                  FlutterLoading.show(context);
                }

                if (state is Authenticated) {
                  FlutterLoading.onDissmiss();
                  GoRouter.of(context).goNamed(AppRoutes.dashboard.name);
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: paddingSize),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AuthHeader(
                          title: 'Welcome Back',
                          subTitle:
                              'Elevate your productivity game - Where all jobs and activities become a breeze with ToDoList!',
                        ),
                        const SizedBox(height: 60),
                        TextFieldApp(
                          title: 'Email',
                          hintText: 'Enter the email',
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
                              builder: (context, state) {
                                Color backgroundColor = primaryColor;
                                if (state is AuthInitial) {
                                  if (state.emailAddress.isEmpty ||
                                      state.password.isEmpty) {
                                    backgroundColor = buttonColor;
                                  }
                                }

                                return ButtonApp(
                                  text: 'LOGIN',
                                  backgroundColor: backgroundColor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.5,
                                  onPressed: backgroundColor == buttonColor
                                      ? null
                                      : () => context
                                          .read<AuthCubit>()
                                          .submitLogin(),
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
                              onPressed: () async {
                                //  print(FirebaseAuth.instance.currentUser);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Center(
                            child: InkWell(
                              onTap: () => GoRouter.of(context)
                                  .go(AppRoutes.signUp.path),
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
                                      text: 'Sign up',
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
          },
        ),
      ),
    );
  }
}
