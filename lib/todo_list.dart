import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './todo_list_state.dart';

class TodoList extends StatelessWidget {
  const TodoList();

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoListState>(
      builder: (context, state, child) => state.loading == true
          ? loadingWidget()
          : _todoList(state.filteredList),
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

  Widget _listItems(context, TodoItem item, index) {
    ///Initierar Padding runt varje List Item.
    return Padding(
      padding: const EdgeInsets.all(10.0),

      ///Skapar en rad för varje item i listan
      child: ListTile(
        ///Hämtar metoden checkBox - ger en checkBox på varje rad som placeras först
        leading: Container(
          child: _checkBox(context, item),
        ),

        ///ropar på metoden removeButton - placeras längst ut

        trailing: Container(
          child: removeButton(context, item),
        ),

        ///texten från varje item från klassen TodoItem - ger den teckenstorlek 15
        title: Text(
          item.item,
          style: TextStyle(
            fontSize: 15,
            decoration: item.isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
      ),
    );
  }

  Widget _checkBox(context, TodoItem item) {
    ///returnerar CheckBox
    return Checkbox(
      checkColor: Colors.white,

      ///varje item från klassen börjar med värdet false
      value: item.isChecked,

      ///initierar bool newValue vilket är värdet som anges
      /// när man trycker på boxen
      onChanged: (bool? newValue) {
        ///Hänvisar till provider och TodoListState
        ///ger metoden whenChanged vilket item som ska ändras
        ///samt det nya värdet
        Provider.of<TodoListState>(context, listen: false)
            .whenChanged(item, newValue);
      },
    );
  }

  Widget removeButton(context, TodoItem item) {
    return IconButton(
      onPressed: () {
        ///ger item till TidoListState och anropar metoden
        ///RemoveListItem för att ta bort item från listan
        Provider.of<TodoListState>(context, listen: false).removeListItem(item);
      },
      icon: const Icon(Icons.highlight_remove),
    );
  }

  Widget loadingWidget() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(backgroundColor: Colors.grey),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Please wait',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
