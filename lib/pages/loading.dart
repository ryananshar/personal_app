import 'package:flutter/material.dart';
import 'package:first_flutter/services/region_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setupWorldTime() async {
    RegionTime instance = RegionTime(
        location: 'Jakarta', flag: 'germany.png', url: 'Asia/Jakarta');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.tealAccent,
        body: Center(
          child: SpinKitFoldingCube(
            color: Colors.white,
            size: 170.0,
          ),
        ));
  }
}
