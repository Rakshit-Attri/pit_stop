import 'package:flutter/material.dart';
import 'package:pit_stop/screens/onboarding/splashScreen.dart';
import 'package:pit_stop/utils/colors.dart';
import 'package:pit_stop/utils/helper_functions.dart';
import 'package:provider/provider.dart';

import 'providers/UserAuth.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserAuth()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PitStop', navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,

          scaffoldBackgroundColor: Colors.white
          ),
      home: const SplashScreen(),
      // home: const MainMenu(),
    );
  }
}


/*

Home page - Latest schedule
Races detail page on tap of schedule arrow
add images in driver details and minor changes in UI
 */