///TODO: Behöver lösa hur man får till Button i varje item i listan

import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  TodoList();

  @override
  Widget build(BuildContext context) {
    return Container(
      ///Hämtar listan
      child: _todoList(),
    );
  }

  Widget _todoList() {
    ///Skapar lista för att se output - kommer att ändras senare
    var list = [
      'Clean my room',
      'Walk the dog',
      'Clean the apartment',
      'complete the first tasks for this assignment',
    ];
    return ListView(
      ///Initierar ListView med varje Item i list. Varje Item läggs in i _ListItems för att skapa Padding runt omkring
      children: list
          .map(
            (item) => _listItems(item),
          )
          .toList(),
    );
  }

  Widget _listItems(item) {
    ///Initierar Padding runt varje List Item.
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        item,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}
