import 'package:flutter/material.dart';
import 'package:termii_app/utils/dimensions.dart';

import 'screens/onboarding_screen.dart';
import 'utils/themedata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      title: 'Shoppr',
      theme: CustomThemeData.appThemeData(context),
      home: const OnboardingPage(),
    );
  }
}
