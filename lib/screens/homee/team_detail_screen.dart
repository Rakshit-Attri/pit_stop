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
          padding: EdgeInsets.all(20),
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
                        style: TextStyle(fontSize: 40, color: Colors.white))),
                Container(
                    child: Text(team.carName,
                        style: TextStyle(fontSize: 40, color: Colors.white))),
                Text(
                  '2024 Season',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                        child: Text(team.position,
                            style:
                                TextStyle(fontSize: 40, color: Colors.white))),
                    Text(
                      'Pos',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                        child: Text(team.points,
                            style:
                                TextStyle(fontSize: 30, color: Colors.white))),
                    Text(
                      'PTS',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.workspace_premium_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(team.wins,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        Text(
                          'Wins',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.stacked_bar_chart_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(team.podiums,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        Text(
                          'Podiums',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.volcano_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(team.poles,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        Text(
                          'Poles',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.dnd_forwardslash_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(team.dnfs,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        Text(
                          'DNFs',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                        child: Text(team.driver1,
                            style:
                                TextStyle(fontSize: 20, color: Colors.white))),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                        child: Text(team.driver2,
                            style:
                                TextStyle(fontSize: 20, color: Colors.white))),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.format_size_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(team.carName,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        Text(
                          'Chassie',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(team.powerUnit,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        Text(
                          'Power Unit',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(team.teamP,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        Text(
                          'Team Principal',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.addchart_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(team.firstentry,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        Text(
                          'First Entry',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.adjust_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(team.constchamp,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        Text(
                          'First Win',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.workspace_premium_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(team.driverchamp,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        Text(
                          'World Championships',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(team.base,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        Text(
                          'Date of Birth',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    child: Text(team.details,
                        style: TextStyle(fontSize: 20, color: Colors.white))),
                SizedBox(
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
