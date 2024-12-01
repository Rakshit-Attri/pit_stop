import 'package:flutter/material.dart';
import 'package:pit_stop/utils/essentials.dart';
import 'package:pit_stop/utils/helper_functions.dart';

import '../../models/stamdings_model.dart';
import '../../utils/colors.dart';

class TeamDetailScreen extends StatelessWidget {
  const TeamDetailScreen({super.key, required this.team});

  final Team team;

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value,
                style: const TextStyle(fontSize: 20, color: Colors.white)),
            Text(label,
                style: const TextStyle(fontSize: 15, color: Colors.white)),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Details: ${team.name}'),
        elevation: 60,
        backgroundColor: const Color.fromARGB(255, 236, 154, 1),
        shadowColor: Colors.amberAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.black87, Colors.black],
            radius: 0.65,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(team.name,
                  style: const TextStyle(fontSize: 40, color: Colors.white)),
              Text(team.carName,
                  style: const TextStyle(fontSize: 40, color: Colors.white)),
              const Text('2024 Season',
                  style: TextStyle(fontSize: 15, color: Colors.white)),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow(Icons.star, 'Position', team.position),
                      const SizedBox(height: 15),
                      _buildInfoRow(
                          Icons.bar_chart, 'Points', team.points.toString()),
                      const SizedBox(height: 15),
                      _buildInfoRow(Icons.workspace_premium, 'Wins',
                          team.wins.toString()),
                      const SizedBox(height: 15),
                      _buildInfoRow(
                          Icons.stacked_bar_chart, 'Podiums', team.podiums),
                      const SizedBox(height: 15),
                      _buildInfoRow(Icons.volcano, 'Poles', team.poles),
                      const SizedBox(height: 15),
                      _buildInfoRow(Icons.dnd_forwardslash, 'DNFs', team.dnfs),
                    ],
                  ),
                  Image.network(
                    HelperFunctions.getMediaFetchUrl(team.imageUrl),
                    width: E.width(context) * 0.56,
                    //height: 350,
                    height: E.height(context) * 0.35,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              _buildInfoRow(Icons.person, 'Driver 1', team.driver1),
              const SizedBox(height: 15),
              _buildInfoRow(Icons.person, 'Driver 2', team.driver2),
              const SizedBox(height: 15),
              _buildInfoRow(Icons.car_repair, 'Chassis', team.carName),
              const SizedBox(height: 15),
              _buildInfoRow(Icons.power, 'Power Unit', team.powerUnit),
              const SizedBox(height: 15),
              _buildInfoRow(
                  Icons.person_pin_circle, 'Team Principal', team.teamP),
              const SizedBox(height: 15),
              _buildInfoRow(Icons.addchart, 'First Entry', team.firstentry),
              const SizedBox(height: 15),
              _buildInfoRow(
                  Icons.adjust, 'Constructor Championships', team.constchamp),
              const SizedBox(height: 15),
              _buildInfoRow(Icons.workspace_premium, 'Driver Championships',
                  team.driverchamp),
              const SizedBox(height: 15),
              _buildInfoRow(Icons.location_on, 'Base', team.base),
              const SizedBox(height: 15),
              Text(
                team.details,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
