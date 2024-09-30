import 'package:flutter/material.dart';
import 'package:pit_stop/screens/homescreen.dart';
import 'package:pit_stop/screens/schedule.dart';
import 'package:pit_stop/screens/standings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    Homescreen(), // Assuming you have a HomeScreen widget in home.dart
    Schedule(),
    Standings(), // Assuming you have a StandingsScreen widget in standings.dart
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: 'Standings',
          ),
        ],
      ),
    );
  }
}
