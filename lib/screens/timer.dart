import 'package:flutter/material.dart';


class Timer extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("Timer", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[300])),
    elevation: 0.0,
    ),
    body: Container(),
    );
  }
}
