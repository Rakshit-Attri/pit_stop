import 'package:flutter/material.dart';

class RaceResultScreen extends StatefulWidget {
  String schedule;
  RaceResultScreen({super.key,required this.schedule});

  @override
  State<RaceResultScreen> createState() => _RaceResultScreenState();
}

class _RaceResultScreenState extends State<RaceResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
          colors: [Colors.black87, Colors.black],
          radius: 0.65,
        )),
        padding: const EdgeInsets.all(20),
        child:
        Center(child: Text(widget.schedule,style: const TextStyle(color: Colors.white),)),
      ),
    );
  }
}
