import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class RegionTime {
  String location;
  String? time;
  String flag;
  String url;
  bool? isDayTime;

  RegionTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // get time properties from api
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // DateTime obj
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // time = now.toString();
      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      // print('caught error: $e');
      time = 'Can not fetch time data';
    }
  }
}
