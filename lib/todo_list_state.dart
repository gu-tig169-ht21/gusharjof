import 'package:flutter/material.dart';

///Klassen TodoItem blir en instans av varje item i list
class TodoItem {
  String item;
  bool? isChecked;

  TodoItem({required this.item, this.isChecked = false});
}

class TodoListState extends ChangeNotifier {
  final List<TodoItem> _list = [];

  List<TodoItem> get list => _list;

  /// lägger till item i listan
  void addListItem(item) {
    _list.add(item);
    notifyListeners();
  }

  ///tar bort item ur listan via index
  void removeListItem(index) {
    _list.removeAt(index);
    notifyListeners();
  }

  ///ger value: isChecked värdet sant eller falskt för item i TodoItem
  void whenChanged(TodoItem item, newValue) {
    item.isChecked = newValue;
    notifyListeners();
  }
}
