import 'package:to_do_list/export.dart';
import 'package:to_do_list/src/ui/forgot_password/export_forgot.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AuthHeader(
                  title: 'Forgot Password?',
                  subTitle:
                      'To reset your password, you need your email or mobile number that can be authenticated',
                ),
                Expanded(
                  flex: 3,
                  child: SvgPicture.asset(
                    AssetSvg.forgotPasswordSvg,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                TextFieldApp(
                  hintText: 'Enter the email',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  onChanged: (text) {},
                  title: 'Email',
                ),
                const SizedBox(height: 20.0),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: heightButton,
                        child: ButtonApp(
                          text: 'Reset Password',
                          onPressed: () => GoRouter.of(context)
                              .pushNamed(AppRoutes.checkYourEmail.name),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      SizedBox(
                        width: double.infinity,
                        height: heightButton,
                        child: ButtonApp(
                          text: 'Back to Login',
                          onPressed: () => GoRouter.of(context).pop(),
                          backgroundColor: buttonColor,
                          fontWeight: FontWeight.w500,
                          textColor: whiteColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
