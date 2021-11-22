import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './todo_list.dart';
import './second_page.dart';
import './todo_list_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.arrow_drop_down_circle_outlined),
            offset: const Offset(0, 50),
            onSelected: (value) {
              Provider.of<TodoListState>(context, listen: false)
                  .filterList(value);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(child: Text('All'), value: 0),
              const PopupMenuItem(child: Text('Completed'), value: 1),
              const PopupMenuItem(child: Text('Remaining'), value: 2)
            ],
          ),
        ],
      ),

      body: const TodoList(),

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
