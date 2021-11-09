import 'package:flutter/material.dart';
import './button.dart';

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
      'Wake up',
      'Walk the dog',
      'Clean the apartment',
      'Take a look at the assignment',
      'Do not panic',
      'Prepare Lunch',
      'Eat Lunch'
    ];
    return ListView(
      ///Initierar ListView med varje Item i list.
      ///Varje Item läggs in i _ListItems för att skapa Padding runt omkring
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

      ///Skapar en rad för varje item i listan
      child: Row(
        children: [
          ///Hämtar metoden checkBox - ger en checkBox på varje rad
          _checkBox(),

          ///Hämtar texten från varje Item i TodoList - ger den teckenstorlek 15
          Text(
            item,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),

          ///Hämtar klassen Button och ger den namnargumenten.
          ///buttonText ges tom för att det inte behövs en text vid detta anropet
          Button(
            buttonIcon: Icons.highlight_remove,
          ),
        ],
      ),
    );
  }

  Widget _checkBox() {
    return Container(
      child: Checkbox(
        checkColor: Colors.white,
        value: false,
        onChanged: (bool) {},
      ),
    );
  }
}
