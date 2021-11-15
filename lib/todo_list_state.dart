import 'package:flutter/material.dart';

class TodoListState extends ChangeNotifier {
  final List _list = [];
  final String _item = '';
  final int _index = 0;

  List get list => _list;
  String get item => _item;
  int get index => _index;

  void addListItem(item) {
    _list.add(item);
    notifyListeners();
  }

  void removeListItem(index) {
    _list.removeAt(index);
    notifyListeners();
  }
}
