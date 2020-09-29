import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:geolocator/geolocator.dart';




class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {

  final Geolocator geolocator =
  Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("Clock", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[300])),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Stack(
          children:<Widget> [
           Container(
            child: Center(
              child: AnalogClock(
                      decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.white),
                          color: Colors.transparent,
                          shape: BoxShape.circle),
                      width: 200.0,
                      isLive: true,
                      hourHandColor: Colors.yellow,
                      minuteHandColor: Colors.red,
                      showSecondHand: true,
                      numberColor: Colors.white,
                      showNumbers: true,
                      textScaleFactor: 1.4,
                      showTicks: true,
                      showDigitalClock: true,
                digitalClockColor: Colors.white,
                    ),
            ),
            ),

            // To display the user's location
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Center(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                    Icons.location_on,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 8,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Location',
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,letterSpacing: 1,fontSize: 18),
                                        textAlign:TextAlign.center ,
                                      ),
                                      if (_currentPosition != null &&
                                          _currentAddress != null)
                                        SizedBox(height: 5,),
                                        Text(_currentAddress,
                                            style: TextStyle(color: Colors.white, letterSpacing: 1)),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 8,),
                              ],
                            ),
                          ],
                        )
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
