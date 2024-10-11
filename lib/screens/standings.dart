import 'package:flutter/material.dart';
import 'package:pit_stop/data/standings_data.dart';
import 'package:pit_stop/utilities.dart';

class Standings extends StatefulWidget {
  const Standings({Key? key}) : super(key: key);

  @override
  _StandingsState createState() => _StandingsState();
}

class _StandingsState extends State<Standings> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _selectedColor = Color(0xff1a73e8);
  final _tabs = [
    Tab(text: 'Driver'),
    Tab(text: 'Team'),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
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
        backgroundColor: Colors.black.withBlue(10),
      ),
      body: Column(
        children: [
          // TabBar with Driver and Team tabs
          TabBar(
            splashFactory: NoSplash.splashFactory,
            controller: _tabController,
            tabs: _tabs,
            unselectedLabelColor: Colors.black,
            labelColor: _selectedColor,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              color: _selectedColor.withOpacity(0.2),
            ),
          ),
          
          // TabBarView to show different content for each tab
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // First tab: Driver Standings
                drivers.isNotEmpty
                    ? ListView.builder(
                        itemCount: drivers.length,
                        itemBuilder: (ctx, index) => ListTile(
                          leading: Column(
                            children: [
                              myText(drivers[index].number,
                                  textColor: Colors.white,
                                  context: context,
                                  fontSize: 22),
                            ],
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  myText(drivers[index].name,
                                      textColor: Colors.white,
                                      context: context,
                                      fontSize: 20),
                                  myText(drivers[index].team,
                                      textColor: Colors.white,
                                      context: context,
                                      fontSize: 18),
                                ],
                              ),
                              Column(
                                children: [
                                  myText(drivers[index].points,
                                      textColor: Colors.white,
                                      context: context,
                                      fontSize: 16),
                                  myText('pts',
                                      textColor: Colors.white,
                                      context: context,
                                      fontSize: 16),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    : Center(child: Text('No driver standings available')), // Placeholder when driver standings are empty

                // Second tab: Team Standings
                teams.isNotEmpty
                    ? ListView.builder(
                        itemCount: teams.length,
                        itemBuilder: (ctx, index) => ListTile(
                          leading: Column(
                            children: [
                              myText(teams[index].position,
                                  textColor: Colors.white,
                                  context: context,
                                  fontSize: 22),
                            ],
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  myText(teams[index].name,
                                      textColor: Colors.white,
                                      context: context,
                                      fontSize: 20),
                                  myText(teams[index].points,
                                      textColor: Colors.white,
                                      context: context,
                                      fontSize: 16),
                                ],
                              ),
                              Column(
                                children: [
                                  myText(teams[index].wins,
                                      textColor: Colors.white,
                                      context: context,
                                      fontSize: 16),
                                  myText('wins',
                                      textColor: Colors.white,
                                      context: context,
                                      fontSize: 16),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    : Center(child: Text('No team standings available')), // Placeholder when team standings are empty
              ],
            ),
          ),
        ],
      ),
    );
  }
}
