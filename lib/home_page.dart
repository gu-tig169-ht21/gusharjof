import 'package:flutter/material.dart';
import './todo_list.dart';
import './second_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        centerTitle: true,
        actions: [Text('Dropdown goes here')],
      ),

      body: TodoList(),

      ///Kallar på metoden floatingButton
      floatingActionButton: floatingButton(context),
    );
  }

  Widget floatingButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        ///Hämtar SecondScreen vid klick
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondScreen(),
          ),
        );
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.blue,
    );
  }

  ///Widget dropDown() {
  ///return
  ///}
}
