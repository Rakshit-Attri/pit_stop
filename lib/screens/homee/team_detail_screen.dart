import 'package:flutter/material.dart';
import 'package:pit_stop/data/stamdings_model.dart';
import 'package:pit_stop/data/standings_data.dart';

class TeamDetailScreen extends StatelessWidget {
  const TeamDetailScreen({super.key, required this.team});

  final Team team;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'team Details ${team.name}',
        ),
        elevation: 10,
        backgroundColor: Colors.transparent.withOpacity(1),
      ),
      body: SizedBox.expand(
        child: Container(
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
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                    child: Text(team.name,
                        style: const TextStyle(fontSize: 40, color: Colors.white))),
                Container(
                    child: Text(team.carName,
                        style: const TextStyle(fontSize: 40, color: Colors.white))),
                const Text(
                  '2024 Season',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                        child: Text(team.position,
                            style:
                                const TextStyle(fontSize: 40, color: Colors.white))),
                    const Text(
                      'Pos',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                        child: Text(team.points,
                            style:
                                const TextStyle(fontSize: 30, color: Colors.white))),
                    const Text(
                      'PTS',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.workspace_premium_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(team.wins,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        const Text(
                          'Wins',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.stacked_bar_chart_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(team.podiums,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        const Text(
                          'Podiums',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.volcano_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(team.poles,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        const Text(
                          'Poles',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.dnd_forwardslash_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(team.dnfs,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        const Text(
                          'DNFs',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                        child: Text(team.driver1,
                            style:
                                const TextStyle(fontSize: 20, color: Colors.white))),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                        child: Text(team.driver2,
                            style:
                                const TextStyle(fontSize: 20, color: Colors.white))),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.format_size_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(team.carName,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        const Text(
                          'Chassie',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(team.powerUnit,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        const Text(
                          'Power Unit',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(team.teamP,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        const Text(
                          'Team Principal',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.addchart_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(team.firstentry,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        const Text(
                          'First Entry',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.adjust_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(team.constchamp,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        const Text(
                          'First Win',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.workspace_premium_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(team.driverchamp,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        const Text(
                          'World Championships',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(team.base,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        const Text(
                          'Date of Birth',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    child: Text(team.details,
                        style: const TextStyle(fontSize: 20, color: Colors.white))),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
