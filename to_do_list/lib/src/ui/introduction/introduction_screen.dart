import 'package:to_do_list/export.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: paddingSize),
                  child: TextApp(
                    'ToDoList',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: SvgPicture.asset(
                  AssetSvg.introductSvg,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  margin: const EdgeInsets.only(bottom: paddingSize),
                  // color: whiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Flexible(
                        fit: FlexFit.tight,
                        child: FractionallySizedBox(
                          widthFactor: 0.8,
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              TextSpan(
                                text: 'Stay organized,\n',
                                style: TextStyle(
                                  fontFamily: FontFamily.dmSans,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'get things ',
                                    style: TextStyle(
                                      fontFamily: FontFamily.dmSans,
                                      fontSize: 30,
                                      color: secondaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'done!',
                                    style: TextStyle(
                                      fontFamily: FontFamily.dmSans,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      const Flexible(
                        fit: FlexFit.tight,
                        child: FractionallySizedBox(
                          alignment: Alignment.topLeft,
                          widthFactor: 0.8,
                          child: FittedBox(
                            alignment: Alignment.topLeft,
                            child: TextApp(
                              'Empower your day, conquer your tasks, and\nseize every moment with our powerful\nToDoList app.',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              textColor: Color(0xFF524B6B),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(flex: 1),
                      SizedBox(
                        height: heightButton,
                        width: double.infinity,
                        child: ButtonApp(
                          text: 'Get Started',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
