import 'package:flutter/material.dart';

import '../../networkCalls/myDio.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/essentials.dart';
import '../../widgets/toast_manager.dart';
import 'VerifyOtpPassword.dart';
import 'package:flutter_svg/svg.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}
class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  Future<void> _submitEmail(String email) async {
    if (email.isEmpty) {
      ToastManager.errorToast("Please enter your email address");
      return;
    }
    setState(() {
      isLoading = true;
    });
    try {
      var response = await MyDio().post('${Constants.baseUrl}auth/send-reset-otp', data: {
        'email': email,
      });

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyOtpScreen(email_id: email),
          ),
        );
      } else {
        ToastManager.errorToast("Failed to send OTP. Please try again.");
      }
    } catch (e) {
      ToastManager.errorToast("An error occurred. Please try again later.");
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
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.black87, Colors.black],
              radius: 0.65,
            ),
          ),
          child: Stack(children: [
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  E.heightSpacer(140),
                  E.myText('FORGOT PASSWORD', context: context, fontSize: 18,),
                  E.heightSpacer(32),
                  E.myText(
                    E.capitalizeEachWord(
                      'Please enter the email associated with your account. You will receive an OTP via email.',
                    ),
                    color: Primary.white,
                    context: context,
                    fontSize: 16,
                  ),
                  E.heightSpacer(32),
                  E.myTextFormField(
                    context: context,
                    controller: emailController,
                    label: 'Email',
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Primary.white,
                    ),
                  ),
                  E.heightSpacer(32),
                  E.purpleButton(
                    context: context,
                    text: 'SEND',
                    color: Primary.orange,
                    fontWeight: FontWeight.bold,
                    circularRadius: 8,
                    isLoading: isLoading,
                    onTap: () {
                      _submitEmail(emailController.text);
                    },
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
