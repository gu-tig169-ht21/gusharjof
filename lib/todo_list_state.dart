import 'package:flutter/material.dart';
import './todo_internet.dart';

///Klassen TodoItem blir en instans av varje item i list
class TodoItem {
  String id;
  String item;
  bool isChecked;

  TodoItem({this.id = '', required this.item, this.isChecked = false});

  static Map<String, dynamic> toJson(TodoItem item) {
    return {
      'title': item.item,
      'done': item.isChecked,
    };
  }

  static TodoItem fromJson(Map<String, dynamic> json) {
    return TodoItem(
      id: json['id'],
      item: json['title'],
      isChecked: json['done'],
    );
  }
}

class TodoListState extends ChangeNotifier {
  List<TodoItem> _list = [];
  List<TodoItem> _filteredList = [];

  ///Getter för listan FilteredList
  List<TodoItem> get filteredList => _filteredList;

  Future getList() async {
    List<TodoItem> list = await TodoInternet.getItems();
    _list = list;
    _filteredList = _list;
    notifyListeners();
  }

  void addListItem(TodoItem item) async {
    _list = await TodoInternet.addTodo(item);
    _filteredList = _list;
    notifyListeners();
  }

  void removeListItem(TodoItem item) async {
    _list = await TodoInternet.deleteItem(item.id);
    _filteredList = _list;
    notifyListeners();
  }

  void whenChanged(TodoItem item, newValue) async {
    _list = await TodoInternet.updateTodo(item, newValue);
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
