///TODO: Fråga om FloatingActionButton - Går den att använda utanför Scaffold?

import 'package:flutter/material.dart';
import './todo_list.dart';
import './second_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Todo List'),
        ),
      ),
      body: Center(
        child: TodoList(),
      ),

      ///Hade velat ha denna som en separat metod eller klass
      floatingActionButton: FloatingActionButton(
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
      ),
    );
  }
}
