import 'package:flutter/material.dart';
import 'package:pit_stop/data/schedule_model.dart';

class CircuitDetail extends StatefulWidget {
  const CircuitDetail({super.key, required this.race});
  final Race race;
  @override
  State<CircuitDetail> createState() => _CircuitDetailState();
}

class _CircuitDetailState extends State<CircuitDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circuit Details ${widget.race.title}'),
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
                widget.race.round,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                widget.race.title,
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
            Container(
              child: Text(
                widget.race.track,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            Container(
              child: Text(
                widget.race.duration,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            Container(
              child: Text(
                widget.race.distance,
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
            Container(
              child: Text(
                widget.race.laps,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                widget.race.turns,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                widget.race.speed,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                widget.race.elevation,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 0.5)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fri,FP1',
                        style: TextStyle(color: Colors.amber),
                      ),
                      Text(
                        widget.race.fp1,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Fri    FP2',
                        style: TextStyle(color: Colors.amber),
                      ),
                      Text(
                        widget.race.fp2,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Fri    FP3'),
                      Text(
                        widget.race.fp3,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text('Fri    Quali'),
                      ),
                      Container(
                        child: Text(
                          widget.race.quali,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text('Fri,Race'),
                      ),
                      Container(
                        child: Text(
                          widget.race.race,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Text(widget.race.details),
            ),
          ],
        ),
      ),
    );
  }
}
