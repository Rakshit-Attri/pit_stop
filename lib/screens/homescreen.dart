import 'package:flutter/material.dart';
import 'package:pit_stop/utilities.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.transparent.withOpacity(0.9),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: const RadialGradient(
          colors: [Colors.black87, Colors.black],
          radius: 0.65,
        )),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/maxverpf1.jpg',
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              myText('Leader',
                                  context: context,
                                  textColor: Colors.white,
                                  fontSize: 20),
                              myText('Verstappen',
                                  context: context,
                                  textColor: Colors.blue.shade800,
                                  fontSize: 28),
                              myText('Red Bull',
                                  context: context,
                                  textColor: Colors.red[900],
                                  fontSize: 24),
                              SizedBox(height: 40),
                              myText('331',
                                  context: context,
                                  textColor: Colors.deepOrange[600],
                                  fontSize: 20),
                              myText('pts', context: context, fontSize: 16),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/mclarenf1.jpg',
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              Icon(Icons.tour_rounded),
                              myText('Leader',
                                  context: context,
                                  textColor: Colors.white,
                                  fontSize: 20),
                              myText('McLaren',
                                  context: context,
                                  textColor: Colors.amber[800],
                                  fontSize: 28),
                              myText('NOR/PIA',
                                  context: context,
                                  textColor: Colors.deepOrange[400],
                                  fontSize: 24),
                              SizedBox(height: 50),
                              myText('331',
                                  context: context,
                                  textColor: Colors.deepOrange[600],
                                  fontSize: 20),
                              myText('pts',
                                  context: context,
                                  textColor: Colors.white,
                                  fontSize: 16),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.greenAccent.shade200, width: 0.3)),
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        myText(
                          '18/24 Grand Prix Completed',
                          textColor: Colors.greenAccent[700],
                          context: context,
                          fontSize: 22,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                myText('1082 Laps',
                                    context: context,
                                    textColor: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                myText('Completed',
                                    context: context,
                                    textColor: Colors.blueGrey[600],
                                    fontSize: 18),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                myText('5,480.9 km',
                                    context: context,
                                    textColor: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                myText('Distance Covered',
                                    context: context,
                                    textColor: Colors.blueGrey[600],
                                    fontSize: 18),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
