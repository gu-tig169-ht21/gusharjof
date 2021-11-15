import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './todo_list_state.dart';

class TodoList extends StatelessWidget {
  TodoList();

  @override
  Widget build(BuildContext context) {
    return Container(
      ///Hämtar listan
      child: Consumer<TodoListState>(
        builder: (context, state, child) => _todoList(state.list),
      ),
    );
  }

  Widget _todoList(list) {
    ///Skapar lista för att se output - kommer att ändras senare

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return _listItems(list[index], index);
      },
    );
  }

  Widget _listItems(item, index) {
    ///Initierar Padding runt varje List Item.
    return Padding(
      padding: const EdgeInsets.all(10.0),

      ///Skapar en rad för varje item i listan
      child: ListTile(
        ///Hämtar metoden checkBox - ger en checkBox på varje rad som placeras först
        leading: Container(
          child: _checkBox(),
        ),
        trailing: Container(
          ///ropar på metoden removeButton - placeras längst ut
          child: removeButton(),
        ),

        ///Hämtar texten från varje Item i TodoList - ger den teckenstorlek 15
        title: Text(
          item,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _checkBox() {
    return Checkbox(
      checkColor: Colors.white,
      value: false,
      onChanged: (bool) {},
    );
  }

  Widget removeButton() {
    return IconButton(
      onPressed: () {
        print('Remove pressed ');
      },
      icon: Icon(Icons.highlight_remove),
    );
  }
}
