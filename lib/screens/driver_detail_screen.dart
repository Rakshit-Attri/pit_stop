import 'package:flutter/material.dart';
import 'package:pit_stop/utilities.dart';
import '../data/stamdings_model.dart';

class DriverDetailScreen extends StatelessWidget {
  const DriverDetailScreen({super.key, required this.driver});

  final Driver driver;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.white);
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Details ${driver.name}'),
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.black87, Colors.black],
              radius: 0.65,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(driver.name, style: textStyle.copyWith(fontSize: 20)),
              Text(driver.number, style: textStyle.copyWith(fontSize: 40)),
              Text(driver.points, style: textStyle.copyWith(fontSize: 30)),
              Text(driver.wins, style: textStyle.copyWith(fontSize: 15)),
              Text(driver.podiums, style: textStyle.copyWith(fontSize: 40)),
              Text(driver.poles, style: textStyle.copyWith(fontSize: 20)),
              Text(driver.dnfs, style: textStyle.copyWith(fontSize: 20)),
              Text(driver.drivercode, style: textStyle.copyWith(fontSize: 20)),
              Text(driver.team, style: textStyle.copyWith(fontSize: 20)),
              Text(driver.firstentry, style: textStyle.copyWith(fontSize: 20)),
              Text(driver.firstwin, style: textStyle.copyWith(fontSize: 20)),
              Text(driver.wc, style: textStyle.copyWith(fontSize: 20)),
              Text(driver.dob, style: textStyle.copyWith(fontSize: 20)),
              Text(driver.country, style: textStyle.copyWith(fontSize: 20)),
              Text(driver.details, style: textStyle),
            ],
          ),
        ),
      ),
    );
  }
}
