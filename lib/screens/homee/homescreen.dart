import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:pit_stop/data/schedule_model.dart';

import '../../utils/essentials.dart';
import '../drawer/drawer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({
    super.key,
  });

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.transparent.withOpacity(1),
      ),
      drawer: const DrawerWidget(),
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
          colors: [Colors.black87, Colors.black],
          radius: 0.65,
        )),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 300,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    viewportFraction: 1,
                  ),
                  items: [
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
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  E.myText('Leader',
                                      context: context,
                                      color: Colors.white,
                                      fontSize: 20),
                                  E.myText('Verstappen',
                                      context: context,
                                      color: Colors.blue.shade800,
                                      fontSize: 28),
                                  E.myText('Red Bull',
                                      context: context,
                                      color: Colors.red[900],
                                      fontSize: 24),
                                  const SizedBox(height: 40),
                                  E.myText('331',
                                      context: context,
                                      color: Colors.deepOrange[600],
                                      fontSize: 20),
                                  E.myText('pts', context: context, fontSize: 16),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  const Icon(Icons.tour_rounded),
                                  E.myText('Leader',
                                      context: context,
                                      color: Colors.white,
                                      fontSize: 20),
                                  E.myText('McLaren',
                                      context: context,
                                      color: Colors.amber[800],
                                      fontSize: 28),
                                  E.myText('NOR/PIA',
                                      context: context,
                                      color: Colors.deepOrange[400],
                                      fontSize: 24),
                                  const SizedBox(height: 50),
                                  E.myText('331',
                                      context: context,
                                      color: Colors.deepOrange[600],
                                      fontSize: 20),
                                  E.myText('pts',
                                      context: context,
                                      color: Colors.white,
                                      fontSize: 16),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
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
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40,
                              ),

                              // E.myText('Round ${widget.race.round}',
                              //     context: context,
                              //     color: Colors.white,
                              //     fontSize: 20),
                              // E.myText(widget.race.title,
                              //     context: context,
                              //     color: Colors.white,
                              //     fontSize: 28),
                              // E.myText(widget.race.city,
                              //     context: context,
                              //     color: Colors.white,
                              //     fontSize: 24),
                              // SizedBox(height: 50),
                              // E.myText(widget.race.duration,
                              //     context: context,
                              //     color: Colors.white,
                              //     fontSize: 20),
                              //timer to be added
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.greenAccent.shade200, width: 0.3)),
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        E.myText(
                          '18/24 Grand Prix Completed',
                          color: Colors.greenAccent[700],
                          context: context,
                          fontSize: 22,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                E.myText('1082 Laps',
                                    context: context,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                E.myText('Completed',
                                    context: context,
                                    color: Colors.blueGrey[600],
                                    fontSize: 18),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                E.myText('5,480.9 km',
                                    context: context,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                E.myText('Distance Covered',
                                    context: context,
                                    color: Colors.blueGrey[600],
                                    fontSize: 18),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
