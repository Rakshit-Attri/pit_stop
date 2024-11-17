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
        elevation: 10,
        backgroundColor: Colors.transparent.withOpacity(1),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
          colors: [Colors.black87, Colors.black],
          radius: 0.65,
        )),
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  'Round ${widget.race.round}',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                  widget.race.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                  widget.race.track,
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                  widget.race.duration,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                  widget.race.distance,
                  style: const TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  children: [
                    const Icon(
                      Icons.restart_alt_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.race.laps,
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const Text(
                          'No. of Laps',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  children: [
                    const Icon(
                      Icons.turn_right_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.race.turns,
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const Text(
                          'Turns',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  children: [
                    const Icon(
                      Icons.speed_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.race.speed,
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const Text(
                          'Top Speed',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  children: [
                    const Icon(
                      Icons.wifi_channel_rounded,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          widget.race.elevation,
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const Text(
                          'Elevation',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 0.5)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Fri    ',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          widget.race.fp1,
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Fri    FP2',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          widget.race.fp2,
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Sat    FP3',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          widget.race.fp3,
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: const Text(
                            'Sat    Quali',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Container(
                          child: Text(
                            widget.race.quali,
                            style: const TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: const Text(
                            'Sun    Race',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Container(
                          child: Text(
                            widget.race.race,
                            style: const TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                  widget.race.details,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
