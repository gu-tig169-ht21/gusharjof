//Klass skapad för att göra en generisk knapp av IconButton ..
//kan utvidgas med att köra argument i konstruktorn med argument
//för färg, icon och action vid tryck

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final IconData buttonIcon;
  final String buttonText;
  Button({required this.buttonIcon, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              print('Pressed');
            },
            icon: Icon(buttonIcon),
          ),
          Text(buttonText),
        ],
      ),
    );
  }
}
