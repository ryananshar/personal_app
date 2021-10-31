// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          backgroundColor: Colors.tealAccent[400],
          title: Text('Choose location'),
          centerTitle: true,
          elevation: 5,
        ),
        body: ElevatedButton(
            onPressed: () {
              setState(() {
                counter += 1;
              });
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
            ),
            child: Text('counter is $counter')));
  }
}
