import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../utils/colors.dart';
import '../../../utils/essentials.dart';

class OtpBox extends StatefulWidget {
  final Function(String) onOtpCompleted;

  const OtpBox({super.key, required this.onOtpCompleted});

  @override
  _OtpBoxState createState() => _OtpBoxState();

  @override
  String toStringShort() => 'Rounded With Shadow';
}

class _OtpBoxState extends State<OtpBox> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 48,
      height: 48,
      textStyle: TextStyle(
        fontSize: 20,
        color: Primary.black,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Primary.black.withOpacity(0.2)),
      ),
    );

    final cursor = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 21,
        height: 1,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Primary.black.withOpacity(0.15),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Primary.black.withOpacity(0.2)),
        ),
      ),
    );

    return Container(
      height: 140,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Primary.black.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            E.myText("Enter Your OTP Here.",
                context: context, color: Primary.darkGrey),
            E.heightSpacer(20),
            Center(
              child: Pinput(
                length: 6,
                controller: controller,
                focusNode: focusNode,
                defaultPinTheme: defaultPinTheme,
                separatorBuilder: (index) => const SizedBox(width: 16),
                showCursor: true,
                cursor: cursor,
                onCompleted: (otp) {
                  widget.onOtpCompleted(otp);
                },
              ),
            ),
            E.heightSpacer(16),
          ],
        ),
      ),
    );
  }
}
