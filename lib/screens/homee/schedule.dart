import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pit_stop/screens/homee/race_details_screem.dart';
import 'package:pit_stop/utils/colors.dart';
import 'package:pit_stop/utils/essentials.dart';

import '../../models/schedule_model.dart';
import '../../networkCalls/myDio.dart';
import '../../utils/constants.dart';
import 'circute_detail_screen.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Race> races = [];
  bool isLoading = true; // Add this variable to manage the loading state
  final _selectedColor = Colors.white;
  final _tabs = [
    const Tab(text: 'Upcoming'),
    const Tab(text: 'Past'),
  ];

  Future<void> fetchRaces() async {
    try {
      setState(() {
        isLoading = true; // Start loading
      });
      final response = await MyDio().get('${Constants.baseUrl}api/Races');
      print(response);
      final List<dynamic> data = response.data;
      setState(() {
        races = data.map((json) => Race.fromJson(json)).toList();
        isLoading = false; // Data is fetched, stop loading
      });
    } catch (e) {
      setState(() {
        isLoading = false; // Stop loading in case of error
      });
      print(e);
    }
  }

  @override
  void initState() {
    fetchRaces();
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
        centerTitle: true,
        title: E.myText("SCHEDULE", context: context, fontSize: 20),
        backgroundColor: Primary.orange,
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
                    ? Center(child: CircularProgressIndicator( color: Colors.orange,))
                    : TabBarView(
                  controller: _tabController,
                  children: [
                    // First tab: Upcoming Races
                    races.isNotEmpty
                        ? ListView.builder(
                      itemCount: races.length,
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
                                        E.myText(races[index].day,
                                            color: Colors.grey[350],
                                            context: context),
                                        E.myText(races[index].month,
                                            color: Colors.grey[350],
                                            context: context),
                                      ],
                                    ),
                                    title: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: 200,
                                          child: Column(
                                            children: [
                                              E.myText(
                                                  races[index]
                                                      .round,
                                                  color:
                                                  Colors.white,
                                                  context: context,
                                                  fontSize: 16),
                                              E.myText(
                                                  races[index]
                                                      .title,
                                                  color:
                                                  Colors.white,
                                                  context: context,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold,
                                                  fontSize: 18),
                                              E.myText(
                                                  races[index].city,
                                                  color: Colors.white,
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
                                                    race: races[
                                                    index],
                                                  )));
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                        : const Center(
                        child: Text('No upcoming races')), // Placeholder when list is empty

                    // Second tab: Past Races

                    races.isNotEmpty
                        ? ListView.builder(
                        itemCount: races.length,
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
                                                    Radius.circular(
                                                        25))),
                                            child: ListTile(
                                              leading: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  E.myText(
                                                      races[index].day,
                                                      color: Colors
                                                          .grey[350],
                                                      context: context),
                                                  E.myText(
                                                      races[index]
                                                          .month,
                                                      color: Colors
                                                          .grey[350],
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
                                                            races[index]
                                                                .round,
                                                            color: Colors
                                                                .white,
                                                            context:
                                                            context,
                                                            fontSize:
                                                            16),
                                                        E.myText(
                                                            races[index]
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
                                                            races[index]
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
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (ctx) =>
                                                            RaceDetail(
                                                              race:
                                                              races[
                                                              index],
                                                            )));
                                              },
                                            ),
                                          ))))
                            ]))
                        : const Center(
                        child: Text('No past races')), // Placeholder when list is empty
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
