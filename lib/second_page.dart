import 'package:flutter/material.dart';
import './button.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 80),
          child: Text('Enter Task'),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            _inputText(),
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
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextField(
        decoration: InputDecoration(hintText: 'Task...'),
      ),
    );
  }
}
