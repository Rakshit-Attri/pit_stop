import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:pit_stop/utils/colors.dart';

import '../homee/homescreen.dart';
import '../homee/schedule.dart';
import '../homee/standings.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final GlobalKey<CurvedNavigationBarState> _curvednavigationkey = GlobalKey();

  int _currentIndex = 0;
  final List<Widget> _children = [
    const Homescreen(),
    const Schedule(),
    const Standings(),
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
      bottomNavigationBar: CurvedNavigationBar(
        key: _curvednavigationkey,
        index: 0,
        height: 65,
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: Primary.orange,
          ),
          Icon(
            Icons.schedule,
            size: 30,
            color: Primary.orange,
          ),
          Icon(
            Icons.table_chart,
            size: 30,
            color: Primary.orange,
          ),
        ],
        color: Colors.black,
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.red,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: onTabTapped,
      ),
    );
  }
}














/*class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const Homescreen(),
    const Schedule(),
    const Standings(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          /*boxShadow: [
            BoxShadow(color: Colors.white, spreadRadius: 0, blurRadius: 10),
          ],*/
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: BottomNavigationBar(
            onTap: onTabTapped,
            selectedItemColor: Colors.orange[800],
            unselectedItemColor: Colors.white,
            backgroundColor: Colors.transparent.withOpacity(0.7),
            currentIndex: _currentIndex,
            items: const [
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
        ),
      ),
    );
  }
}*/