import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './todo_list_state.dart';

class TodoList extends StatelessWidget {
  TodoList();

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoListState>(
      builder: (context, state, child) => _todoList(state.list),
    );
  }

  Widget _todoList(list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return _listItems(context, list[index], index);
      },
    );
  }

  Widget _listItems(context, item, index) {
    ///Initierar Padding runt varje List Item.
    return Padding(
      padding: const EdgeInsets.all(10.0),

      ///Skapar en rad för varje item i listan
      child: ListTile(
        ///Hämtar metoden checkBox - ger en checkBox på varje rad som placeras först
        leading: Container(
          child: _checkBox(context, item),
        ),
        trailing: Container(
          ///ropar på metoden removeButton - placeras längst ut
          child: removeButton(context, index),
        ),

        ///Hämtar texten från varje Item i TodoList - ger den teckenstorlek 15
        title: Text(
          item.item,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _checkBox(context, item) {
    ///var newValue;
    return Checkbox(
      checkColor: Colors.white,
      value: item.isChecked,
      onChanged: (bool? newValue) {
        Provider.of<TodoListState>(context, listen: false)
            .whenChanged(item, newValue);
      },
    );
  }

  Widget removeButton(context, index) {
    return IconButton(
      onPressed: () {
        Provider.of<TodoListState>(context, listen: false)
            .removeListItem(index);
      },
      icon: const Icon(Icons.highlight_remove),
    );
  }
}
