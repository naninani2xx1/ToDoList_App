import 'package:to_do_list/common/components/auth_header.dart';
import 'package:to_do_list/export.dart';

class CheckYourEmailScreen extends StatelessWidget {
  const CheckYourEmailScreen({super.key});

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
                  title: 'Check Your Email',
                  subTitle:
                      'We have sent the reset password to the email address brandonelouis@gmial.com',
                ),
                Expanded(
                  flex: 3,
                  child: SvgPicture.asset(
                    AssetSvg.checkEmailSvg,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                const SizedBox(height: 30.0),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: heightButton,
                        child: ButtonApp(
                          text: 'Open Your Email',
                          onPressed: () {},
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
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Center(
                          child: InkWell(
                            onTap: () =>
                                GoRouter.of(context).go(AppRoutes.signUp.path),
                            child: const Text.rich(
                              TextSpan(
                                text: 'You have not received the email? ',
                                style: TextStyle(
                                  fontFamily: FontFamily.dmSans,
                                  fontSize: 12.0,
                                  color: textColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Resend',
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
                      ),
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
