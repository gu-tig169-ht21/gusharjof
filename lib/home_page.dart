//klassen HomePage hämtar TodoList
//skapar sedan en floatingActionButton

//Problem: Listan hamnar inte centralt fast jag använder Center-widget?
//Kan inte använda mig av klassen Button.dart fastän jag kan skapa en egen knapp
//direkt i home_page
//TODO: Kolla detta på handledning

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
