import 'package:flutter/material.dart';
import 'package:pit_stop/data/stamdings_model.dart';

class DriverDetailScreen extends StatelessWidget {
  const DriverDetailScreen({super.key, required this.driver});

  final Driver driver;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('driver'),
    );
  }
}
