import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                Image.asset(
                  'maxverpf1.jpg',
                  height: 300,
                  width: double.infinity,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.tour_rounded),
                      Text('Leader'),
                      Text('Verstapen'),
                      Text('Red Bull'),
                      SizedBox(
                        height: 50,
                      ),
                      Text('331'),
                      Text('pts'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                Image.asset(
                  'mclarenf1.jpg',
                  height: 300,
                  width: double.infinity,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.tour_rounded),
                      Text('Leader'),
                      Text('McLaren'),
                      Text('Nor / Pia'),
                      SizedBox(
                        height: 50,
                      ),
                      Text('364'),
                      Text('pts'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('18/24 Grand Prix Completed'),
                Row(
                  children: [
                    Column(
                      children: [
                        Text('1082 Laps'),
                        Text('Completed'),
                      ],
                    ),
                    Column(
                      children: [Text('5,480.9 km'), Text('Distance Covered')],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
