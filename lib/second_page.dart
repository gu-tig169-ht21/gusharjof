import 'package:flutter/material.dart';
import 'package:my_first_app/todo_list_state.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  final inputText = TextEditingController();

  SecondScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Task'),

        ///Placera Texten i mitten. Blev inte helt rätt med en Center-Widget
        centerTitle: true,
      ),
      body: Column(
        children: [
          ///Hämtar metoden _inputText
          _inputText(),
          _addButton(context)

          ///Ropar på Klassen Button med Namnargument för Icon och Text
        ],
      ),
    );
  }

  Widget _inputText() {
    ///Skapar TextField
    return Container(
      ///Drar in kanterna med 15 - ser snyggare ut
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: TextField(
        controller: inputText,
        decoration: const InputDecoration(hintText: 'Task...'),
      ),
    );
  }

  Widget _addButton(context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            var newTask = inputText.text;
            Provider.of<TodoListState>(context, listen: false)
                .addListItem(TodoItem(item: newTask));
            inputText.clear();
          },
          icon: const Icon(Icons.add_task),
        ),
        const Text('Add')
      ],
    );
  }
}
