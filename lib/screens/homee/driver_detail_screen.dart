import 'package:flutter/material.dart';


import '../../models/stamdings_model.dart';
import '../../utils/colors.dart';

class DriverDetailScreen extends StatelessWidget {
  const DriverDetailScreen({super.key, required this.driver});

  final Driver driver;

  Widget _buildInfoRow({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 30),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value, style: const TextStyle(fontSize: 20, color: Colors.white)),
              Text(label, style: const TextStyle(fontSize: 15, color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Details: ${driver.name}'),
        elevation: 10,
        backgroundColor: Primary.orange,
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
              Text(
                driver.name,
                style: const TextStyle(fontSize: 40, color: Colors.white),
              ),
              const Text(
                '2024 Season',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              const SizedBox(height: 20),
              _buildInfoRow(
                icon: Icons.format_list_numbered,
                value: driver.number,
                label: 'Pos',
              ),
              _buildInfoRow(
                icon: Icons.score,
                value: driver.points,
                label: 'PTS',
              ),
              _buildInfoRow(
                icon: Icons.workspace_premium_rounded,
                value: driver.wins,
                label: 'Wins',
              ),
              _buildInfoRow(
                icon: Icons.stacked_bar_chart,
                value: driver.podiums,
                label: 'Podiums',
              ),
              _buildInfoRow(
                icon: Icons.volcano_rounded,
                value: driver.poles,
                label: 'Poles',
              ),
              _buildInfoRow(
                icon: Icons.dnd_forwardslash_rounded,
                value: driver.dnfs,
                label: 'DNFs',
              ),
              _buildInfoRow(
                icon: Icons.emoji_flags,
                value: driver.drivercode,
                label: 'Driver Code',
              ),
              _buildInfoRow(
                icon: Icons.format_size_rounded,
                value: driver.team,
                label: 'Team',
              ),
              _buildInfoRow(
                icon: Icons.addchart_rounded,
                value: driver.firstentry,
                label: 'First Entry',
              ),
              _buildInfoRow(
                icon: Icons.adjust_rounded,
                value: driver.firstwin,
                label: 'First Win',
              ),
              _buildInfoRow(
                icon: Icons.workspace_premium,
                value: driver.wc,
                label: 'World Championships',
              ),
              _buildInfoRow(
                icon: Icons.calendar_today_rounded,
                value: driver.dob,
                label: 'Date of Birth',
              ),
              _buildInfoRow(
                icon: Icons.home_rounded,
                value: driver.country,
                label: 'Country',
              ),
              const SizedBox(height: 15),
              Text(
                driver.details,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
