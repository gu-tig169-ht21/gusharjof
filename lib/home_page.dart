import 'package:flutter/material.dart';
import './todo_list.dart';
import './second_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              print('Test');
            },
            itemBuilder: (context) => [
              const PopupMenuItem(child: Text('All'), value: 1),
              const PopupMenuItem(child: Text('Completed'), value: 2),
              const PopupMenuItem(child: Text('Remaining'), value: 3)
            ],
          ),
        ],
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
      child: const Icon(Icons.add),
      backgroundColor: Colors.blue,
    );
  }
}
