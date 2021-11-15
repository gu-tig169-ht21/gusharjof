import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  ///Klass skapad för att göra en generisk knapp av IconButton
  ///Varje Objekt som skapas måste ge argument för vilken Icon och Text som knappen ska ha

  final IconData buttonIcon;
  final String buttonText;
  Button({required this.buttonIcon, this.buttonText = ''});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              ///kolla så att knappen funkar
              print('Pressed');
            },

            ///ger knappen rätt Icon
            icon: Icon(buttonIcon),
          ),

          ///Ger knappen rätt tillhörande text - En tom sträng är default
          Text(buttonText),
        ],
      ),
    );
  }
}
