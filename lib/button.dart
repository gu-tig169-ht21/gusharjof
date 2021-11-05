//Klass skapad för att göra en generisk knapp av FloatingActionButton..
//Av någon anledning så får jag inte hänvisa till denna när jag importerar
//till home_page.dart...
//kan utvidgas med att köra argument i konstruktorn med argument
//för färg, icon och action vid tryck

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          null;
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
