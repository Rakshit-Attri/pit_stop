import 'package:flutter/material.dart';
import '../../networkCalls/myDio.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/essentials.dart';
import '../../utils/image_constants.dart';
import '../../widgets/toast_manager.dart';
import 'ResentScreen.dart';
import 'package:flutter_svg/svg.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key, required this.email_id});
  final String email_id;

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool newPassObscureText = true;
  bool confirmObscureText = true;
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isLoading = false;
  Future<void> _changePassword(String new_password) async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await MyDio().post(
        '${Constants.baseUrl}password-reset/reset-password',
        data: {
          "email": widget.email_id,
          "newPassword": new_password,
        },
      );
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ResentScreen()),
        );
      } else {
        ToastManager.errorToast("Failed to Change Password. Please try again.");
      }
    } catch (e) {
      ToastManager.errorToast("An error occurred. Please try again later.");
    }finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    confirmPasswordController.addListener(() {
      if (newPassController.text != confirmPasswordController.text) {
        ToastManager.errorToast("Passwords do not match");
      }
    });
  }

  @override
  void dispose() {
    newPassController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Stack(
          children: [
            SvgPicture.asset("assets/Graphic.svg", fit: BoxFit.cover),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    E.heightSpacer(140),
                    E.myText('CREATE A NEW PASSWORD', context: context, fontSize: 18),
                    E.heightSpacer(32),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: E.myText('Create New Password and Confirm New Password',
                          context: context, fontSize: 16),
                    ),
                    E.heightSpacer(32),
                    E.myTextFormField(
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            newPassObscureText = !newPassObscureText;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: SvgPicture.asset(
                            newPassObscureText ? ImageConstant.eye : ImageConstant.eyeCut,
                            color: Primary.darkGrey,
                            fit: BoxFit.contain,
                            height: 26,
                            width: 26,
                          ),
                        ),
                      ),
                      context: context,
                      controller: newPassController,
                      obscureText: newPassObscureText,
                      label: 'NEW PASSWORD',
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
                            confirmObscureText ? ImageConstant.eye : ImageConstant.eyeCut,
                            color: Primary.darkGrey,
                            fit: BoxFit.contain,
                            height: 26,
                            width: 26,
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
                    E.heightSpacer(32),
                    E.purpleButton(
                      context: context,
                      text: 'SUBMIT',
                      fontWeight: FontWeight.bold,
                      onTap: () {
                        if (newPassController.text == confirmPasswordController.text) {
                          _changePassword(confirmPasswordController.text);
                        } else {
                          ToastManager.errorToast("Passwords do not match");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
