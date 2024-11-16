import 'package:flutter/material.dart';

class RaceResultScreen extends StatefulWidget {
  const RaceResultScreen({super.key});

  @override
  State<RaceResultScreen> createState() => _RaceResultScreenState();
}

class _RaceResultScreenState extends State<RaceResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: const RadialGradient(
          colors: [Colors.black87, Colors.black],
          radius: 0.65,
        )),
        padding: EdgeInsets.all(20),
      ),
    );
  }
}
