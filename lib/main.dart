

import 'package:flutter/material.dart';
import 'package:pit_stop/screens/home.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'Pit_Stop',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: false,
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor:Colors.black.withBlue(10),
          ),
          // home: CallReceiveScreen()
          home: Home() //SplashScreen1()

    );
  }
}
