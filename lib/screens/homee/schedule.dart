import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pit_stop/screens/homee/race_details_screem.dart';
import 'package:pit_stop/utils/colors.dart';
import 'package:pit_stop/utils/essentials.dart';

import '../../models/schedule_model.dart';
import '../../networkCalls/myDio.dart';
import '../../utils/constants.dart';
import '../../utils/helper_functions.dart';
import 'circute_detail_screen.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<dynamic> upcomingRaces = [];
  List<dynamic> pastRaces = [];
  bool isLoading = true;

  final _selectedColor = Colors.white;
  final _tabs = [
    const Tab(text: 'Upcoming'),
    const Tab(text: 'Past'),
  ];

  Future<void> fetchRaces() async {
    try {
      setState(() {
        isLoading = true;
      });
      final response = await MyDio().get('${Constants.baseUrl}api/Races');
      final data = response.data;
      final fetchedUpcomingRaces = data['upcoming'] ?? [];
      final fetchedPastRaces = data['past'] ?? [];

      setState(() {
        upcomingRaces =
            fetchedUpcomingRaces.map((json) => Race.fromJson(json)).toList();
        pastRaces =
            fetchedPastRaces.map((json) => Race.fromJson(json)).toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchRaces();
    _tabController = TabController(length: 2, vsync: this);
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
        elevation: 70,
        centerTitle: true,
        title: E.myText("SCHEDULE", context: context, fontSize: 20),
        backgroundColor: Primary.orange,
        shadowColor: Colors.orangeAccent,
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
              TabBar(
                controller: _tabController,
                tabs: _tabs,
                unselectedLabelColor: Colors.white,
                labelColor: _selectedColor,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: _selectedColor.withOpacity(0.2),
                ),
              ),
              E.heightSpacer(20),
              Expanded(
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Colors.orange,
                      ))
                    : TabBarView(
                        controller: _tabController,
                        children: [
                          // First tab: Upcoming Races
                          upcomingRaces.isNotEmpty
                              ? ListView.builder(
                                  itemCount: upcomingRaces.length,
                                  itemBuilder: (ctx, index) => Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(25)),
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
                                                          Radius.circular(25))),
                                              child: ListTile(
                                                leading: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    E.myText(
                                                        HelperFunctions
                                                            .getTimeAgo(
                                                                upcomingRaces[
                                                                        index]
                                                                    .startTime),
                                                        color: Colors.grey[350],
                                                        context: context),
                                                  ],
                                                ),
                                                title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    SizedBox(
                                                      width: 200,
                                                      child: Column(
                                                        children: [
                                                          E.myText(
                                                              upcomingRaces[
                                                                      index]
                                                                  .round,
                                                              color:
                                                                  Colors.white,
                                                              context: context,
                                                              fontSize: 16),
                                                          E.myText(
                                                              upcomingRaces[
                                                                      index]
                                                                  .title,
                                                              color:
                                                                  Colors.white,
                                                              context: context,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18),
                                                          E.myText(
                                                              upcomingRaces[
                                                                      index]
                                                                  .city,
                                                              color:
                                                                  Colors.white,
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
                                                                      index])));
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Center(
                                  child: E.myText('No upcoming races',
                                      color: Colors.white,
                                      context: context,
                                      fontSize: 16)),

                          // Second tab: Past Races
                          pastRaces.isNotEmpty
                              ? ListView.builder(
                                  itemCount: pastRaces.length,
                                  itemBuilder: (ctx, index) => Stack(
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(25)),
                                              child: BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                      sigmaX: 5, sigmaY: 5),
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.1),
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
                                                                  HelperFunctions.getTimeAgo(
                                                                      pastRaces[
                                                                              index]
                                                                          .startTime),
                                                                  color: Colors
                                                                          .grey[
                                                                      350],
                                                                  context:
                                                                      context),
                                                            ],
                                                          ),
                                                          title: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              SizedBox(
                                                                width: 200,
                                                                child: Column(
                                                                  children: [
                                                                    E.myText(
                                                                        pastRaces[
                                                                                index]
                                                                            .round,
                                                                        color: Colors
                                                                            .white,
                                                                        context:
                                                                            context,
                                                                        fontSize:
                                                                            16),
                                                                    E.myText(
                                                                        pastRaces[
                                                                                index]
                                                                            .title,
                                                                        color: Colors
                                                                            .white,
                                                                        context:
                                                                            context,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            18),
                                                                    E.myText(
                                                                        pastRaces[
                                                                                index]
                                                                            .city,
                                                                        color: Colors
                                                                            .white,
                                                                        context:
                                                                            context,
                                                                        fontSize:
                                                                            16),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          onTap: () {
                                                            Navigator.of(
                                                                    context)
                                                                .push(MaterialPageRoute(
                                                                    builder: (ctx) =>
                                                                        RaceDetail(
                                                                            race:
                                                                                pastRaces[index])));
                                                          },
                                                        ),
                                                      ))))
                                        ],
                                      ))
                              : Center(
                                  child: E.myText('No past races',
                                      color: Colors.white,
                                      context: context,
                                      fontSize: 16)),
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
