import 'package:flutter/material.dart';

///Klassen TodoItem blir en instans av varje item i list
class TodoItem {
  String item;
  bool? isChecked;

  TodoItem({required this.item, this.isChecked = false});
}

class TodoListState extends ChangeNotifier {
  final List<TodoItem> _list = [];
  List<TodoItem> _filteredList = [];

  List<TodoItem> get filteredList => _filteredList;

  /// lägger till item i listan
  void addListItem(item) {
    _list.add(item);
    _filteredList = _list;
    notifyListeners();
  }

  ///tar bort item ur listan via index
  void removeListItem(item) {
    _list.remove(item);
    _filteredList = _list;
    notifyListeners();
  }

  ///ger value: isChecked värdet sant eller falskt för item i TodoItem
  void whenChanged(TodoItem item, newValue) {
    item.isChecked = newValue;
    notifyListeners();
  }

  void filterList(value) {
    if (value == 0) {
      _filteredList = _list;
    } else if (value == 1) {
      _filteredList = _list.where((item) => item.isChecked == true).toList();
    } else {
      _filteredList = _list.where((item) => item.isChecked == false).toList();
    }
    notifyListeners();
  }
}
