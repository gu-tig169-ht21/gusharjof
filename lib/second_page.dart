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
        ///ger TextField en controller som kan spara värdet
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
            ///initierar variabel för varje sträng som skrivs in
            var newTask = inputText.text;

            ///provider ropar på addListItem och lägger till newTask
            Provider.of<TodoListState>(context, listen: false)
                .addListItem(TodoItem(item: newTask));

            ///rensar TextField vid knapptryck
            inputText.clear();
          },
          icon: const Icon(Icons.add_task),
        ),
        const Text('Add')
      ],
    );
  }
}
