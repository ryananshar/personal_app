import 'package:flutter/material.dart';
import 'package:first_flutter/pages/home.dart';
import 'package:first_flutter/pages/choose_location.dart';
import 'package:first_flutter/pages/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/location': (context) => const ChooseLocation(),
      },
    ));
