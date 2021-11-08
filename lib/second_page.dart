import 'package:flutter/material.dart';
import './button.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          ///Placera Texten i mitten. Blev inte helt rätt med en Center-Widget
          margin: EdgeInsets.only(left: 80),
          child: Text('Enter Task'),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            _inputText(),

            ///Ropar på Klassen Button med Namnargument för Icon och Text
            Button(
              buttonIcon: Icons.add_task,
              buttonText: "Add task",
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputText() {
    ///Skapar TextField
    return Container(
      ///Drar in kanterna med 15 - ser snyggare ut
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextField(
        decoration: InputDecoration(hintText: 'Task...'),
      ),
    );
  }
}
