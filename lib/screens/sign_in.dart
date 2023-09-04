import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:termii_app/screens/dashboard.dart';
import 'package:termii_app/screens/sign_up.dart';

import '../utils/color.dart';
import '../utils/component/button.dart';
import '../utils/component/padded.dart';
import '../utils/component/text_button.dart';
import '../utils/component/text_field.dart';
import '../utils/constants.dart';
import '../utils/dimensions.dart';
import '../utils/navigators.dart';

class SignInScreen extends StatefulHookWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final signInFormKey = GlobalKey<FormState>();

  // void changeValue(WidgetRef ref, bool newValue) {
  //   ref.read(loginCheckingButtonProvider.notifier).update((state) => newValue);
  // }

  @override
  Widget build(BuildContext context) {
    var emailController = useTextEditingController();
    var passwordController = useTextEditingController();
    var isPasswordVisible = useState(true);
    return Scaffold(
      backgroundColor: kWHTCOLOUR,
      body: SingleChildScrollView(
        child: Padded(
          child: Form(
            key: signInFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(getScreenHeight(60)),
                Text(
                  'Log in',
                  style: kTextStyleCustom(
                      fontSize: 24, fontWeight: FontWeight.w700),
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
                Gap(getScreenHeight(32)),
                CustomTextField(
                  controller: emailController,
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
                Gap(getScreenHeight(16)),
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
                Gap(getScreenHeight(52)),
                CustomMainButton(
                  text: 'Sign In',
                  onTap: () async {
                    if (signInFormKey.currentState!.validate()) {
                      RouteNavigators.routeNoWayHome(
                          context, const DashboardScreen());
                    }
                  },
                ),
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
                Gap(getScreenWidth(171)),
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
                      'Don’t have an account?  ',
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
                          const SignUpScreen(),
                        );
                      },
                      title: 'Create Account',
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
