//Main-funktionen. MaterialApp och hämtar HomePage

import 'package:flutter/material.dart';
import './home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo list',
      home: HomePage(),
    );
  }
}
