//klass för ToDo-listan.
//build-funktionen hämtar Widget listView från funktionen _todoList
//_todoList skapar en lista som för tillfället är förbestämd
//returnerar en lista med padding från funktionen _listItems
import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  TodoList();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _todoList(),
    );
  }

  Widget _todoList() {
    var list = [
      'Clean my room',
      'Walk the dog',
      'Clean the apartment',
      'complete the first tasks for this assignment',
    ];
    return ListView(
      children: list
          .map(
            (item) => _listItems(item),
          )
          .toList(),
    );
  }

  Widget _listItems(item) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        item,
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
