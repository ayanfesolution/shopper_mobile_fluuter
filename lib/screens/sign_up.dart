import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:termii_app/screens/dashboard.dart';
import 'package:termii_app/screens/sign_in.dart';
import 'package:termii_app/utils/color.dart';

import '../utils/component/button.dart';
import '../utils/component/padded.dart';
import '../utils/component/text_button.dart';
import '../utils/component/text_field.dart';
import '../utils/constants.dart';
import '../utils/dimensions.dart';
import '../utils/navigators.dart';

class SignUpScreen extends StatefulHookWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signUpEmailFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailTextController = useTextEditingController();

    var passwordController = useTextEditingController();
    var fullName = useTextEditingController();
    var isPasswordVisible = useState(true);
    return Scaffold(
      backgroundColor: kWHTCOLOUR,
      body: SingleChildScrollView(
        child: Padded(
          child: Form(
            key: signUpEmailFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(getScreenHeight(50)),
                Text.rich(
                  TextSpan(
                    text: 'Create an account ',
                    style: kTextStyleCustom(
                        fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
                Gap(getScreenHeight(8)),
                Text(
                  'Let’s create your account',
                  style: kTextStyleCustom(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: kLightGray,
                  ),
                ),
                Gap(getScreenHeight(45)),
                CustomTextField(
                  controller: fullName,
                  hintText: 'Enter your full name',
                  title: 'Full Name',
                ),
                Gap(getScreenHeight(24)),
                CustomTextField(
                  controller: emailTextController,
                  hintText: 'Enter your email address',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  title: 'Email',
                ),
                Gap(getScreenHeight(24)),
                CustomTextField(
                  controller: passwordController,
                  obscureText: isPasswordVisible.value,
                  hintText: 'Enter your password',
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'Password is minimum of 6 characters';
                    } else {
                      return null;
                    }
                  },
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(getScreenHeight(12)),
                    child: InkWell(
                      onTap: () {
                        isPasswordVisible.value = !isPasswordVisible.value;
                      },
                      child: SvgPicture.asset(isPasswordVisible.value
                          ? 'assets/svgs/eye-off.svg'
                          : 'assets/svgs/eye-off.svg'),
                    ),
                  ),
                  title: 'Password',
                ),
                Gap(getScreenHeight(24)),
                CustomMainButton(
                    text: 'Sign Up',
                    backgroundColor: kPRYCOLOUR,
                    onTap: () async {
                      if (signUpEmailFormKey.currentState!.validate()) {
                        RouteNavigators.routeNoWayHome(
                          context,
                          const DashboardScreen(),
                        );
                      }
                    }),
                Gap(getScreenHeight(32)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: getScreenWidth(142),
                      child: Divider(
                        color: kLIGHTINACTIVE,
                        thickness: getScreenHeight(0.5),
                      ),
                    ),
                    Text(
                      'OR',
                      style: kTextStyleCustom(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: kLightGray),
                    ),
                    SizedBox(
                      width: getScreenWidth(142),
                      child: Divider(
                        color: kLIGHTINACTIVE,
                        thickness: getScreenHeight(0.7),
                      ),
                    ),
                  ],
                ),
                Gap(getScreenHeight(34)),
                InkWell(
                  onTap: () async {
                    RouteNavigators.routeNoWayHome(
                        context, const DashboardScreen());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        getScreenHeight(16),
                      ),
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: kPRYCOLOUR,
                      ),
                    ),
                    height: getScreenHeight(56),
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/svgs/logos_google-icon.svg'),
                        Gap(getScreenWidth(15)),
                        Text(
                          'Sign Up with Google',
                          style: kTextStyleCustom(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Gap(getScreenHeight(20)),
                InkWell(
                  onTap: () async {
                    RouteNavigators.routeNoWayHome(
                        context, const DashboardScreen());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        getScreenHeight(16),
                      ),
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: kPRYCOLOUR,
                      ),
                    ),
                    height: getScreenHeight(56),
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/svgs/logos_facebook.svg'),
                        Gap(getScreenWidth(15)),
                        Text(
                          'Sign Up with Google',
                          style: kTextStyleCustom(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Gap(getScreenHeight(23)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                Gap(getScreenHeight(23)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member?  ',
                      style: kTextStyleCustom(
                        fontSize: getScreenHeight(14),
                        fontWeight: FontWeight.w400,
                        color: kLightGray,
                      ),
                    ),
                    CustomTextButton(
                      onTap: () {
                        RouteNavigators.route(
                          context,
                          const SignInScreen(),
                        );
                      },
                      title: 'Log in',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: kPRYCOLOUR,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
