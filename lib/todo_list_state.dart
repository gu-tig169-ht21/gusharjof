import 'package:flutter/material.dart';

class TodoItem {
  String item;
  bool? isChecked;

  TodoItem({required this.item, this.isChecked = false});
}

class TodoListState extends ChangeNotifier {
  final List<TodoItem> _list = [];

  List<TodoItem> get list => _list;

  void addListItem(item) {
    _list.add(item);
    notifyListeners();
  }

  void removeListItem(index) {
    _list.removeAt(index);
    notifyListeners();
  }

  void whenChanged(TodoItem item, newValue) {
    item.isChecked = newValue;
    notifyListeners();
  }
}
