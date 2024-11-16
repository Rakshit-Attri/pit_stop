import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Providers/UserAuth.dart';
import '../../main.dart';
import '../../utils/colors.dart';
import '../../utils/essentials.dart';
import '../../utils/image_constants.dart';
import '../../widgets/toast_manager.dart';
import '../ForgotPasswordFlow/ForgotPassword.dart';
import 'package:provider/provider.dart';

import '../Menu/BottomBar.dart';
import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  login(String email, String password, BuildContext context) async {
    E.looseFocus(context);

    if (email.isEmpty || password.isEmpty) {
      ToastManager.errorToast('Please enter both email and password.');
      return;
    }

    setState(() {
      isLoading = true;
    });

    UserAuth userAuth = Provider.of<UserAuth>(context, listen: false);

    try {
      final result = await userAuth.login(email: email, password: password);

      if (result == true) {
        bool userDataSet = await userAuth.setUserProfileData();
        if (userDataSet) {
          // await _storeFirebaseToken(userAuth);
          ToastManager.successToast("Signed in");
          Navigator.pushAndRemoveUntil(
              navigatorKey.currentContext!,
              MaterialPageRoute(
                builder: (context) => const MainMenu(),
              ),
              (route) => false);
        }
      } else {
        ToastManager.errorToast("Invalid email or password. Please try again.");
      }
    } catch (e) {
      ToastManager.errorToast("Unknown error occurred");
      print('Error: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        E.looseFocus(context);
      },
      child: Scaffold(

          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              SvgPicture.asset("assets/Graphic.svg",fit: BoxFit.cover
                ,),
         Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SvgPicture.asset(ImageConstant.logo),
                  ),
                  E.heightSpacer(50),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: E.myText(
                      'LOGIN',
                      fontSize: 18,
                      isHeader: true,
                      context: context,
                      color: Primary.black,
                    ),
                  ),
                  E.heightSpacer(32),
                  E.myTextFormField(
                    context: context,
                    controller: emailController,
                    label: 'Email or Username',
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Primary.darkGrey,
                    ),
                  ),
                  E.heightSpacer(32),
                  E.myTextFormField(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Primary.darkGrey,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: SvgPicture.asset(
                          obscureText ? ImageConstant.eye : ImageConstant.eyeCut,
                          color: Colors.black,
                          fit: BoxFit.contain,
                          height: 26, width: 26,
                          // height: 12,
                          // width: 12,
                        ),
                      ),

                      // Icon(
                      //   obscureText
                      //       ? Icons.remove_red_eye_outlined
                      //       : Icons.remove_red_eye,
                      //   color: Colors.white,
                      //   size: 20,
                      // ),
                    ),
                    context: context,
                    controller: passwordController,
                    obscureText: obscureText,
                    label: 'Password',
                  ),
                  E.heightSpacer(8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.zero,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotScreen()),
                          );
                        },
                        child: E.myText(
                          'Forgot Password ?',
                          context: context,
                          fontSize: 13,
                          decoration: TextDecoration.underline,
                          color: Primary.darkPurple,
                        ),
                      ),
                    ),
                  ),
                  E.heightSpacer(80),

                  E.heightSpacer(24),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: 'Don’t Have An Account? ',
                        style: TextStyle(color: Primary.lightGrey, fontSize: 13),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                                color: Primary.darkGrey,
                                // fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpScreen(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  E.heightSpacer(32),
                  E.purpleButton(
                      text: 'LOGIN',
                      circularRadius: 8,
                      onTap: () {
                        login(emailController.text.trim(),
                            passwordController.text.trim(), context);
                      },
                      isLoading: isLoading,
                      context: context),
                ],
              ),
            ),
         ] ),
    ) );
  }
}
