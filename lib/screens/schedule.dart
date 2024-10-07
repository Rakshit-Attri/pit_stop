import 'package:flutter/material.dart';
import 'package:pit_stop/data/schedules_data.dart';

//import 'material_design_indicator.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Schedule>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _selectedColor = Color(0xff1a73e8);
  //final _unselectedColor = Color(0xff5f6368);
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
    if (upcomingRaces.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black.withBlue(10),
        ),
        body: Center(
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                tabs: _tabs,
                unselectedLabelColor: Colors.black,
                labelColor: _selectedColor,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(80.0),
                  color: _selectedColor.withOpacity(0.2),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: upcomingRaces.length,
                  itemBuilder: (ctx, index) => ListTile(
                    leading: Column(
                      children: [
                        Text(upcomingRaces[index].day),
                        Text(upcomingRaces[index].month),
                      ],
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(upcomingRaces[index].round),
                            Text(upcomingRaces[index].title),
                            Text(upcomingRaces[index].city),
                          ],
                        ),
                      ],
                    ),
                    /* onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) =>
                      PlacesDetailsScreen(place: widget.places[index])));
                        },*/
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Text('Empty');
  }
}
