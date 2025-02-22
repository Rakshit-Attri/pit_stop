import 'package:flutter/material.dart';
import 'package:pit_stop/models/schedule_model.dart';
import 'package:pit_stop/utils/colors.dart';

import '../../utils/helper_functions.dart';
import 'race_result_screen.dart';

class RaceDetail extends StatefulWidget {
  const RaceDetail({super.key, required this.race});
  final Race race;
  @override
  State<RaceDetail> createState() => _CircuitDetailState();
}

class _CircuitDetailState extends State<RaceDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Race Details ${widget.race.title}'),
          elevation: 10,
          backgroundColor: Primary.orange,
        ),
        body: SizedBox.expand(
          child: Container(
            decoration: const BoxDecoration(
                gradient: RadialGradient(
              colors: [Colors.black87, Colors.black],
              radius: 0.65,
            )),
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: HelperFunctions.getSpacedChildren(items: [
                  Text(
                    'Round ${widget.race.round}',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    widget.race.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.race.track,
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    widget.race.details,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white, width: 0.5)),
                    child: Column(
                      children: HelperFunctions.getSpacedChildren(items: [
                        scheduleRow('Fri    FP1'),
                        scheduleRow('Fri    FP2'),
                        scheduleRow("Sat    FP3"),
                        scheduleRow('Sat    Quali'),
                        scheduleRow('Sun    Race')
                      ], space: 15, column: true),
                    ),
                  )
                ], column: true, space: 15),
              ),
            ),
          ),
        ));
  }

  Widget scheduleRow(String time) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => RaceResultScreen(
                  schedule: time,
                )));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            time,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
