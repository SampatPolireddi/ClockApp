import 'package:clock_app/screens/clock.dart';
import 'package:clock_app/screens/stopWatch.dart';
import 'package:clock_app/screens/timer.dart';
import 'package:flutter/material.dart';
import 'package:clock_app/screens/alarm.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyBottomNavigationBar(),
    );
  }
}








class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

  int _currentIndex=0;
  final List<Widget> _children = [

    Home(),
    Clock(),
    Timer(),
    StopWatch(),
  ];

  void onTappedBar(int index){
    setState(() {
      _currentIndex= index;
    });

}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        onTap: onTappedBar,
        currentIndex: _currentIndex,

        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[900],
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.alarm, color: Colors.white,),
            // ignore: deprecated_member_use
            title: new Text("Alarm",style: TextStyle(color: Colors.white),),
          ),

          BottomNavigationBarItem(
            icon: new Icon(Icons.access_time_rounded, color: Colors.white,),
            // ignore: deprecated_member_use
            title:  new Text("Clock",style: TextStyle(color: Colors.white),),
          ),

          BottomNavigationBarItem(
            icon: new Icon(Icons.hourglass_bottom_rounded, color: Colors.white,),
            // ignore: deprecated_member_use
            title: new Text("Timer",style: TextStyle(color: Colors.white),),
          ),

          BottomNavigationBarItem(
            icon: new Icon(Icons.timer, color: Colors.white,),
            // ignore: deprecated_member_use
            title: new Text("StopWatch",style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}

