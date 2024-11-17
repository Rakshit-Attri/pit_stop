import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../providers/UserAuth.dart';
import '../../utils/colors.dart';
import '../../utils/essentials.dart';
import '../../utils/image_constants.dart';
import '../../widgets/toast_manager.dart';
import 'login.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passwordObscureText = true;
  bool confirmObscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  signup(String email, String password, String confirmPassword,
      BuildContext context) async {
    E.looseFocus(context);
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ToastManager.errorToast('Please fill all required fields.');
      return;
    }
    if (password != confirmPassword) {
      ToastManager.errorToast('Password and confirm password do not match.');
      return;
    }
    setState(() {
      isLoading = true;
    });

    UserAuth userAuth = Provider.of<UserAuth>(context, listen: false);
    try {
      debugPrint('trying signup');
      var result = await userAuth.signUp(email: email, password: password);
      if (result == true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      } else {
        ToastManager.errorToast("Try again");
        setState(() {
          isLoading = false;
        });
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      ToastManager.errorToast("Unknown error occurred");
      print('error is:$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.black87, Colors.black],
              radius: 0.65,
            ),
          ),
          child: Stack(children: [
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SvgPicture.asset(ImageConstant.logo),
                    ),
                    E.heightSpacer(50),
                    E.myText('SIGN UP',
                        context: context, fontSize: 18, color: Primary.orange),
                    E.heightSpacer(32),
                    E.myTextFormField(
                      context: context,
                      controller: emailController,
                      label: 'EMAIL',
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Primary.darkGrey,
                      ),
                    ),
                    E.heightSpacer(24),
                    E.myTextFormField(
                      context: context,
                      controller: phoneController,
                      label: 'PHONE',
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Primary.darkGrey,
                      ),
                    ),
                    E.heightSpacer(24),
                    E.myTextFormField(
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passwordObscureText = !passwordObscureText;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: SvgPicture.asset(
                            passwordObscureText
                                ? ImageConstant.eye
                                : ImageConstant.eyeCut,
                            color: Primary.darkGrey,
                            fit: BoxFit.contain,
                            height: 26, width: 26,
                            // height: 12,
                            // width: 12,
                          ),
                        ),
                      ),
                      context: context,
                      controller: passwordController,
                      obscureText: passwordObscureText,
                      label: 'PASSWORD',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Primary.darkGrey,
                      ),
                    ),
                    E.heightSpacer(24),
                    E.myTextFormField(
                      context: context,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            confirmObscureText = !confirmObscureText;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: SvgPicture.asset(
                            confirmObscureText
                                ? ImageConstant.eye
                                : ImageConstant.eyeCut,
                            color: Primary.darkGrey,
                            fit: BoxFit.contain,
                            height: 26, width: 26,
                            // height: 12,
                            // width: 12,
                          ),
                        ),
                      ),
                      controller: confirmPasswordController,
                      obscureText: confirmObscureText,
                      label: 'CONFIRM PASSWORD',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Primary.darkGrey,
                      ),
                    ),
                    E.heightSpacer(24),
                    Align(
                      alignment: Alignment.center,
                      /**/
                      child: RichText(
                        text: TextSpan(
                          text: 'Already Have An Account? ',
                          style:
                              TextStyle(color: Primary.lightGrey, fontSize: 13),
                          children: [
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                  color: Primary.darkGrey,
                                  fontSize: 14,
                                  // fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // print('Sign up button pressed!');
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    E.heightSpacer(80),
                    E.purpleButton(
                        text: 'VERIFY',
                        color: Primary.orange,
                        context: context,
                        fontWeight: FontWeight.bold,
                        circularRadius: 8,
                        onTap: () {
                          signup(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                              confirmPasswordController.text.trim(),
                              context);
                        },
                        isLoading: isLoading
                        // onTap: () {
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => const ChooseAccountTypeScreen(),
                        //   ));
                        // },
                        ),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
