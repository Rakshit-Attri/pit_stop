import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pit_stop/data/schedules_data.dart';

import 'package:pit_stop/utilities.dart';

import '../data/schedule_model.dart';
import 'circute_detail_screen.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Schedule>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _selectedColor = Colors.white;
  final _tabs = [
    Tab(text: 'Upcoming'),
    Tab(text: 'Past'),
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
        elevation: 10,
        backgroundColor: Colors.transparent.withOpacity(1),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: const RadialGradient(
          colors: [Colors.black87, Colors.black],
          radius: 0.65,
        )),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // TabBar with upcoming and past tabs
              TabBar(
                controller: _tabController,
                tabs: _tabs,
                unselectedLabelColor: Colors.white,
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
                    // First tab: Upcoming Races
                    upcomingRaces.isNotEmpty
                        ? ListView.builder(
                            itemCount: upcomingRaces.length,
                            itemBuilder: (ctx, index) => Stack(children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.1),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(25))),
                                      child: ListTile(
                                        leading: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            myText(upcomingRaces[index].day,
                                                textColor: Colors.grey[350],
                                                context: context),
                                            myText(upcomingRaces[index].month,
                                                textColor: Colors.grey[350],
                                                context: context),
                                          ],
                                        ),
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: 200,
                                              child: Column(
                                                children: [
                                                  myText(
                                                      upcomingRaces[index]
                                                          .round,
                                                      textColor: Colors.white,
                                                      context: context,
                                                      fontSize: 16),
                                                  myText(
                                                      upcomingRaces[index]
                                                          .title,
                                                      textColor: Colors.white,
                                                      context: context,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                  myText(
                                                      upcomingRaces[index].city,
                                                      textColor: Colors.white,
                                                      context: context,
                                                      fontSize: 16),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (ctx) =>
                                                      CircuitDetail(
                                                        race: upcomingRaces[
                                                            index],
                                                      )));
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          )
                        : Center(
                            child: Text(
                                'No upcoming races')), // Placeholder when list is empty

                    // Second tab: Past Races
                    pastRaces.isNotEmpty
                        ? ListView.builder(
                            itemCount: pastRaces.length,
                            itemBuilder: (ctx, index) => Stack(children: [
                                  ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 5, sigmaY: 5),
                                          child: Padding(
                                              padding: const EdgeInsets.all(3),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.1),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                25))),
                                                child: ListTile(
                                                  leading: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      myText(
                                                          pastRaces[index].day,
                                                          textColor:
                                                              Colors.grey[350],
                                                          context: context),
                                                      myText(
                                                          pastRaces[index]
                                                              .month,
                                                          textColor:
                                                              Colors.grey[350],
                                                          context: context),
                                                    ],
                                                  ),
                                                  title: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Container(
                                                        width: 200,
                                                        child: Column(
                                                          children: [
                                                            myText(
                                                                pastRaces[index]
                                                                    .round,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                context:
                                                                    context,
                                                                fontSize: 16),
                                                            myText(
                                                                pastRaces[index]
                                                                    .title,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                context:
                                                                    context,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18),
                                                            myText(
                                                                pastRaces[index]
                                                                    .city,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                context:
                                                                    context,
                                                                fontSize: 16),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (ctx) =>
                                                               CircuitDetail(
                                                                  race:
                                                                      pastRaces[
                                                                          index],
                                                                )));
                                                  },
                                                ),
                                              ))))
                                ]))
                        : Center(
                            child: Text(
                                'No past races')), // Placeholder when list is empty
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
