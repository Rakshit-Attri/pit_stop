import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../networkCalls/myDio.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/essentials.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/toast_manager.dart';
import 'ChangePassword.dart';
import 'widgets/otpBox.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String email_id;

  const VerifyOtpScreen({
    super.key,
    required this.email_id,
  });

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  String? otpCode;
  bool isLoading = false;
  Future<void> _verifyOTP(String otp) async {
    try {
      setState(() {
        isLoading = true;
      });
      var response = await MyDio().post(
          '${Constants.baseUrl}auth/verify-reset-otp',
          data: {'email': widget.email_id, "otp": otp});
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChangePassword(
                    email_id: widget.email_id,
                  )),
        );
      } else {
        ToastManager.errorToast("Failed to verify OTP. Please try again.");
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
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.black87, Colors.black],
            radius: 0.65,
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    E.heightSpacer(140),
                    E.myText('VERIFICATION', context: context, fontSize: 18),
                    E.heightSpacer(32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        E.myText('Enter the OTP sent to \n${widget.email_id}',
                            context: context,
                            fontSize: 16,
                            color: Primary.white),
                        E.myText('Edit',
                            context: context,
                            fontSize: 16,
                            color: Primary.white),
                      ],
                    ),
                    E.heightSpacer(24),
                    OtpBox(
                      onOtpCompleted: (otp) {
                        setState(() {
                          otpCode = otp;
                        });
                      },
                    ),
                    E.heightSpacer(32),
                    E.purpleButton(
                        context: context,
                        text: 'VERIFY',
                        color: Primary.white,
                        fontWeight: FontWeight.bold,
                        onTap: () {
                          if (otpCode != null) {
                            _verifyOTP(otpCode!);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                "Please enter the OTP",
                                style: TextStyle(color: Colors.white),
                              )),
                            );
                          }
                        }),
                    E.heightSpacer(30),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Didn’t Receive The OTP? ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Primary.white,
                          ),
                          children: [
                            TextSpan(
                              text: 'Resend OTP',
                              style: TextStyle(
                                  color: Primary.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Handle OTP resend logic
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
