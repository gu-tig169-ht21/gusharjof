//Main-funktionen. MaterialApp och hämtar HomePage

import 'package:flutter/material.dart';
import './home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///Tar bort flaggan i högra hörnet
      debugShowCheckedModeBanner: false,
      title: 'Todo list',

      ///Ropar på klassen HomePage
      home: HomePage(),
    );
  }
}
