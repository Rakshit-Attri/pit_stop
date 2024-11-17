import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';

import '../../providers/UserAuth.dart';
import '../../main.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../utils/image_constants.dart';
import '../Menu/BottomBar.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkAuthStatus(context);
  }

  checkAuthStatus(BuildContext context) async {
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    String? token = await secureStorage.read(key: 'token');
    print('token:${token ?? ''}');
    UserAuth userAuth =
        Provider.of<UserAuth>(navigatorKey.currentContext!, listen: false);

    bool userDataSet = await userAuth.setUserProfileData();

    if (userDataSet) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MainMenu(),
          ),
          (route) => false);
    } else {
      print('user data not set , create profile');
      // Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
      //     MaterialPageRoute(
      //       builder: (context) => const CreateProfile(),
      //     ),
      //     (route) => false);
      Timer(const Duration(seconds: 1), () {
        Navigator.of(navigatorKey.currentContext!).push(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox.expand(
          child: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.black87, Colors.black],
                radius: 0.65,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text('paa')
                // E.myText('paradiso', context: context,)
                SvgPicture.asset(ImageConstant.logo)
                // Image.asset(ImageConstant.logo),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
