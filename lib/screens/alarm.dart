import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("Alarm", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[300])),
        elevation: 0.0,
      ),
      body: Container(),




      //nav bar for switching between pages

    );
  }
}

