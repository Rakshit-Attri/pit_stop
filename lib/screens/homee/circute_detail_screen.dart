import 'package:flutter/material.dart';
import 'package:pit_stop/models/schedule_model.dart';

import '../../utils/colors.dart';
import '../../utils/essentials.dart';
import '../../utils/helper_functions.dart';

class CircuitDetail extends StatelessWidget {
  const CircuitDetail({super.key, required this.race});
  final Race race;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circuit Details ${race.title}'),
        elevation: 10,
        backgroundColor: Primary.orange,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.black87, Colors.black],
            radius: 0.65,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Round ${race.round}',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 15),
              Text(
                race.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                race.track,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
              const SizedBox(height: 15),
              Text(
                race.duration,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              const SizedBox(height: 15),
              Text(
                race.distance,
                style: const TextStyle(color: Colors.white, fontSize: 40),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow(Icons.restart_alt_rounded, race.laps, 'No. of Laps'),
                      const SizedBox(height: 15),
                      _buildInfoRow(Icons.turn_right_rounded, race.turns, 'Turns'),
                      const SizedBox(height: 15),
                      _buildInfoRow(Icons.speed_rounded, race.speed, 'Top Speed'),
                      const SizedBox(height: 15),
                      _buildInfoRow(Icons.wifi_channel_rounded, race.elevation, 'Elevation'),
                    ],
                  ),
               //  Image.network( HelperFunctions.getMediaFetchUrl(race.imageUrl))
                ],
              ),
              const SizedBox(height: 15),
              _buildScheduleCard(),
              const SizedBox(height: 15),
              Text(
                race.details,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String value, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildScheduleCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white, width: 0.5),
      ),
      child: Column(
        children: [
          _buildScheduleRow('Fri', race.fp1),
          const SizedBox(height: 15),
          _buildScheduleRow('Fri FP2', race.fp2),
          const SizedBox(height: 15),
          _buildScheduleRow('Sat FP3', race.fp3),
          const SizedBox(height: 15),
          _buildScheduleRow('Sat Quali', race.quali),
          const SizedBox(height: 15),
          _buildScheduleRow('Sun Race', race.race),
        ],
      ),
    );
  }

  Widget _buildScheduleRow(String label, String time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        Text(
          time,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ],
    );
  }
}
