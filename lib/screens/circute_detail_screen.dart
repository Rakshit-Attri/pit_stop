import 'package:flutter/material.dart';
import 'package:pit_stop/data/schedule_model.dart';

class CircuitDetail extends StatefulWidget {
  const CircuitDetail({super.key,required this.race});
 final Race race;
  @override
  State<CircuitDetail> createState() => _CircuitDetailState();
}

class _CircuitDetailState extends State<CircuitDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circuit Details ${widget.race.title}'),
      ),
      body: Column(
        children: [Text(widget.race.title),
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(

              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }

}
