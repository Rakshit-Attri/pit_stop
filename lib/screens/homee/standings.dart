import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pit_stop/models/stamdings_model.dart';

import 'package:pit_stop/screens/homee/team_detail_screen.dart';
import '../../networkCalls/myDio.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/essentials.dart';
import 'driver_detail_screen.dart';

class Standings extends StatefulWidget {
  const Standings({super.key});

  @override
  _StandingsState createState() => _StandingsState();
}

class _StandingsState extends State<Standings>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _selectedColor = Colors.white;
  final _tabs = [
    const Tab(text: 'Driver'),
    const Tab(text: 'Team'),
  ];
  List<Driver> drivers = [];
  List<Team> teams = [];
  bool isDriversLoading = true;
  bool isTeamsLoading = true;

  @override
  void initState() {
    fetchDrivers();
    fetchTeams();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  Future<void> fetchDrivers() async {
    try {
      final response = await MyDio().get('${Constants.baseUrl}api/Drivers');
      final List<dynamic> data = response.data;
      setState(() {
        drivers = data.map((json) => Driver.fromJson(json)).toList();
        isDriversLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isDriversLoading = false;
      });
    }
  }

  Future<void> fetchTeams() async {
    try {
      final response = await MyDio().get('${Constants.baseUrl}api/Teams');
      final List<dynamic> data = response.data;
      setState(() {
        teams = data.map((json) => Team.fromJson(json)).toList();
        isTeamsLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isTeamsLoading = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 60,
        centerTitle: true,
        title: E.myText("STANDINGS", context: context, fontSize: 20),
        backgroundColor: Color.fromARGB(255, 239, 72, 0),
        shadowColor: Colors.redAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
          colors: [Colors.black87, Colors.black],
          radius: 0.65,
        )),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // TabBar with Driver and Team tabs
              TabBar(
                splashFactory: NoSplash.splashFactory,
                controller: _tabController,
                tabs: _tabs,
                unselectedLabelColor: Colors.white,
                labelColor: _selectedColor,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(80.0),
                  color: _selectedColor.withOpacity(0.2),
                ),
              ),
              E.heightSpacer(20),

              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // First tab: Driver Standings
                    isDriversLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.orange,
                            ),
                          )
                        : drivers.isNotEmpty
                            ? ListView.builder(
                                itemCount: drivers.length,
                                itemBuilder: (ctx, index) => Stack(children: [
                                      ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(25)),
                                          child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 5, sigmaY: 5),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(3),
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    height: 70,
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(0.1),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    25))),
                                                    child: ListTile(
                                                      leading: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          E.myText(
                                                              drivers[index]
                                                                  .number,
                                                              color:
                                                                  Colors.white,
                                                              context: context,
                                                              fontSize: 22),
                                                        ],
                                                      ),
                                                      title: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            width: 200,
                                                            child: Column(
                                                              children: [
                                                                E.myText(
                                                                    drivers[index]
                                                                        .name,
                                                                    color: Colors
                                                                        .white,
                                                                    context:
                                                                        context,
                                                                    fontSize:
                                                                        20),
                                                                E.myText(
                                                                    drivers[index]
                                                                        .team,
                                                                    color: Colors
                                                                        .white,
                                                                    context:
                                                                        context,
                                                                    fontSize:
                                                                        18),
                                                              ],
                                                            ),
                                                          ),
                                                          Column(
                                                            children: [
                                                              E.myText(
                                                                  drivers[index]
                                                                      .points
                                                                      .toString(),
                                                                  color: Colors
                                                                      .white,
                                                                  context:
                                                                      context,
                                                                  fontSize: 16),
                                                              E.myText('pts',
                                                                  color: Colors
                                                                      .white,
                                                                  context:
                                                                      context,
                                                                  fontSize: 16),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (ctx) =>
                                                                    DriverDetailScreen(
                                                                      driver: drivers[
                                                                          index],
                                                                    )));
                                                      },
                                                    ),
                                                  ))))
                                    ]))
                            : const Center(
                                child: Text(
                                'No driver standings available',
                                style: TextStyle(color: Colors.white),
                              )),

                    // Second tab: Team Standings
                    isTeamsLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.orange,
                            ),
                          )
                        : teams.isNotEmpty
                            ? ListView.builder(
                                itemCount: teams.length,
                                itemBuilder: (ctx, index) => Stack(children: [
                                      ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(25)),
                                          child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 5, sigmaY: 5),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(3),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(0.1),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    25))),
                                                    child: ListTile(
                                                      leading: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          E.myText(
                                                              teams[index]
                                                                  .position,
                                                              color:
                                                                  Colors.white,
                                                              context: context,
                                                              fontSize: 22),
                                                        ],
                                                      ),
                                                      title: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: 200,
                                                            child: Center(
                                                              child: Column(
                                                                children: [
                                                                  E.myText(
                                                                      teams[
                                                                              index]
                                                                          .name,
                                                                      color: Colors
                                                                          .white,
                                                                      context:
                                                                          context,
                                                                      fontSize:
                                                                          20),
                                                                  E.myText(
                                                                      teams[index]
                                                                          .points
                                                                          .toString(),
                                                                      color: Colors
                                                                          .white,
                                                                      context:
                                                                          context,
                                                                      fontSize:
                                                                          16),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Column(
                                                            children: [
                                                              E.myText(
                                                                  teams[index]
                                                                      .wins
                                                                      .toString(),
                                                                  color: Colors
                                                                      .white,
                                                                  context:
                                                                      context,
                                                                  fontSize: 16),
                                                              E.myText('wins',
                                                                  color: Colors
                                                                      .white,
                                                                  context:
                                                                      context,
                                                                  fontSize: 16),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (ctx) =>
                                                                    TeamDetailScreen(
                                                                      team: teams[
                                                                          index],
                                                                    )));
                                                      },
                                                    ),
                                                  ))))
                                    ]))
                            : const Center(
                                child: Text(
                                'No team standings available',
                                style: TextStyle(color: Colors.white),
                              )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
