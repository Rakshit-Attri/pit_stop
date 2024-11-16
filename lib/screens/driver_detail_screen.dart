import 'package:flutter/material.dart';

import '../data/stamdings_model.dart';

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
                    child: Text(driver.name,
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
                        child: Text(driver.number,
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
                        child: Text(driver.points,
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
                            child: Text(driver.wins,
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
                            child: Text(driver.podiums,
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
                            child: Text(driver.poles,
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
                            child: Text(driver.dnfs,
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
                        child: Text(driver.drivercode,
                            style:
                                TextStyle(fontSize: 20, color: Colors.white))),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
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
                            child: Text(driver.team,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        Text(
                          'Team',
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
                            child: Text(driver.firstentry,
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
                            child: Text(driver.firstwin,
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
                            child: Text(driver.wc,
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
                            child: Text(driver.dob,
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
                Row(
                  children: [
                    Icon(
                      Icons.home_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(driver.country,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        Text(
                          'Country',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    child: Text(driver.details,
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
