import 'package:flutter/material.dart';

import '../../data/stamdings_model.dart';



class DriverDetailScreen extends StatelessWidget {
  const DriverDetailScreen({super.key, required this.driver});

  final Driver driver;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Driver Details ${driver.name}',
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
                    child: Text(driver.name,
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
                        child: Text(driver.number,
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
                        child: Text(driver.points,
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
                            child: Text(driver.wins,
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
                            child: Text(driver.podiums,
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
                            child: Text(driver.poles,
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
                            child: Text(driver.dnfs,
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
                        child: Text(driver.drivercode,
                            style:
                                const TextStyle(fontSize: 20, color: Colors.white))),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'VER',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          'Driver Code',
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
                            child: Text(driver.team,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        const Text(
                          'Team',
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
                            child: Text(driver.firstentry,
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
                            child: Text(driver.firstwin,
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
                            child: Text(driver.wc,
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
                            child: Text(driver.dob,
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
                Row(
                  children: [
                    const Icon(
                      Icons.home_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(driver.country,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        const Text(
                          'Country',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    child: Text(driver.details,
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
