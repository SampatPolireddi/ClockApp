import 'package:flutter/material.dart';


class StopWatch extends StatefulWidget {
  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("StopWatch", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[300])),
        elevation: 0.0,
      ),
      body: Container(),
    );
  }
}
