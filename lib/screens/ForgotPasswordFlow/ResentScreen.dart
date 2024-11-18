import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../utils/colors.dart';
import '../../utils/essentials.dart';
import '../../utils/image_constants.dart';
import '../onboarding/signup.dart';

class ResentScreen extends StatefulWidget {
  const ResentScreen({super.key});

  @override
  State<ResentScreen> createState() => _ResentScreenState();
}

class _ResentScreenState extends State<ResentScreen> {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Center(
              //   child: Container(
              //     height: 180,
              //     width: 180,
              //     decoration: BoxDecoration(
              //         shape: BoxShape.circle,
              //         // borderRadius: BorderRadius.circular(50),
              //         gradient: Primary.multiColorGradient),
              //     child: Center(
              //         child: Icon(
              //       Icons.done,
              //       size: 75,
              //       color: Primary.white,
              //     )),
              //   ),
              // ),
              SvgPicture.asset(
                ImageConstant.tickCircle,
        
                fit: BoxFit.contain,
                height: 234, width: 234,
                // height: 12,
                // width: 12,
              ),
              E.heightSpacer(32),
              E.myText(
                E.capitalizeEachWord('your password has been reset'),
                fontSize: 20,
                context: context,
                color: Primary.white,
              ),
              E.heightSpacer(32),

              E.purpleButton(
                  context: context,
                  text: 'DONE',
                  color: Primary.orange,
                  fontWeight: FontWeight.bold,
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                        (route) => false);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
