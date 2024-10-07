import 'package:flutter/material.dart';
import 'package:pit_stop/utilities.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withBlue(10),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/maxverpf1.jpg',
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.tour_rounded),
                      myText('Leader', context: context),
                      myText('Verstappen', context: context),
                      myText('Red Bull', context: context),
                      SizedBox(height: 50),
                      myText('331', context: context),
                      myText('pts', context: context),
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Image.asset(
                  'assets/mclarenf1.jpg',
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.tour_rounded),
                      myText('Leader', context: context,textColor: Colors.white),
                      myText('Verstappen', context: context,textColor: Colors.white),
                      myText('Red Bull', context: context,textColor: Colors.white),
                      SizedBox(height: 50),
                      myText('331', context: context,textColor: Colors.white),
                      myText('pts', context: context,textColor: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  myText('18/24 Grand Prix Completed', textColor: Colors.white, context: context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          myText('1082 Laps', context: context, textColor: Colors.white,fontWeight: FontWeight.bold),
                          myText('Completed', context: context, textColor: Colors.white),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          myText('5,480.9 km', context: context, textColor: Colors.white),
                          myText('Distance Covered', context: context, textColor: Colors.white),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
