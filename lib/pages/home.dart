// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    // background photo
    String bgImage = data['isDayTime'] ? 'dayTime.jpg' : 'nightTime.jpg';
    Color? bgColor =
        data['isDayTime'] ? Colors.cyan[100] : Colors.tealAccent[700];
    Color? txtColor = data['isDayTime'] ? Colors.teal[800] : Colors.white;
    // Color? txtColor = data['isDayTime'] ? Colors.white : Colors.teal[800];

    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/$bgImage'),
          fit: BoxFit.cover,
        )),
        padding: const EdgeInsets.fromLTRB(0, 170, 0, 0),
        child: Column(
          children: <Widget>[
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/location');
              },
              icon: Icon(Icons.edit_location_alt_rounded),
              label: Text('Edit Location'),
              style: TextButton.styleFrom(primary: bgColor),
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2.0,
                    color: txtColor,
                  ),
                )
              ],
            ),
            SizedBox(height: 25.0),
            Text(
              data['time'],
              style: TextStyle(
                  fontSize: 50, fontWeight: FontWeight.w800, color: txtColor),
            )
          ],
        ),
      )),
    );
  }
}
