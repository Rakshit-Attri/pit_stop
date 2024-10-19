import 'package:flutter/material.dart';
import 'package:pit_stop/data/schedule_model.dart';
import 'package:pit_stop/data/schedules_data.dart';
import 'package:pit_stop/utilities.dart';

class CircuteDetailScreen extends StatelessWidget {
  const CircuteDetailScreen({super.key, required this.race});

  final Race race;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circuit Details'),
      ),
      body: Column(
        children: [Text('text')],
      ),
    );
  }
}
