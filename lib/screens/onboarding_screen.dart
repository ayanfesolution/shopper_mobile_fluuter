import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:termii_app/screens/sign_in.dart';
import 'package:termii_app/utils/color.dart';
import 'package:termii_app/utils/component/button.dart';
import 'package:termii_app/utils/component/padded.dart';
import 'package:termii_app/utils/constants.dart';
import 'package:termii_app/utils/dimensions.dart';
import 'package:termii_app/utils/navigators.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/images/splash.png'))),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: getScreenWidth(24),
                right: getScreenWidth(14),
                top: getScreenHeight(50),
              ),
              child: SizedBox(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Define',
                          style: kTextStyleCustom(
                            fontSize: 60,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/ByeWind.png'),
                            Text(
                              'Shoppr',
                              style: kTextStyleCustom(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Text(
                      'Yourself In Your Unique Way.',
                      style: kTextStyleCustom(
                        fontSize: 60,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: getScreenHeight(104),
                  top: getScreenHeight(174),
                ),
                child: SizedBox(
                    // height: getScreenHeight(390),
                    // width: getScreenWidth(354),
                    child: Image.asset('assets/images/onboarding_page.png')),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: getScreenHeight(21)),
                child: Padded(
                  child: CustomMainButton(
                    text: 'Get Started',
                    useCustom: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Get Started',
                          style: kTextStyleCustom(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Gap(getScreenWidth(12)),
                        const Icon(
                          Icons.arrow_forward_sharp,
                          color: kWHTCOLOUR,
                        )
                      ],
                    ),
                    onTap: () {
                      RouteNavigators.route(
                        context,
                        const SignInScreen(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
