import 'package:flutter/material.dart';
import 'package:pit_stop/data/stamdings_model.dart';

class TeamDetailScreen extends StatelessWidget {
  const TeamDetailScreen({super.key, required this.team});

  final Team team;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('team'),
    );
  }
}
