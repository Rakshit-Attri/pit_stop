import 'package:flutter/material.dart';
import 'package:pit_stop/data/stamdings_model.dart';

class DriverDetailScreen extends StatefulWidget {
  const DriverDetailScreen({super.key, required this.driver});

  final Driver driver;

  @override
  State<DriverDetailScreen> createState() => _DriverDetailScreenState();
}

class _DriverDetailScreenState extends State<DriverDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Details ${widget.driver.name}'),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: const RadialGradient(
          colors: [Colors.black87, Colors.black],
          radius: 0.65,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                widget.driver.name,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                widget.driver.number,
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
            Container(
              child: Text(
                widget.driver.points,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            Container(
              child: Text(
                widget.driver.wins,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            Container(
              child: Text(
                widget.driver.podiums,
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
            Container(
              child: Text(
                widget.driver.poles,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                widget.driver.dnfs,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                widget.driver.drivercode,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                widget.driver.team,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                widget.driver.firstentry,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                widget.driver.firstwin,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                widget.driver.wc,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                widget.driver.dob,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                widget.driver.country,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              child: Text(widget.driver.details),
            ),
          ],
        ),
      ),
    );
  }
}
