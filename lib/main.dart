//Main-funktionen. MaterialApp och hämtar HomePage

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './todo_list_state.dart';
import './home_page.dart';

void main() {
  var state = TodoListState();
  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(),
    ),
  );
}

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
