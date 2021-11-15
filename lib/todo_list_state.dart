import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoListState extends ChangeNotifier {
  final List _list = [];

  List get list => _list;
  void addListItem(item) {
    _list.add(item);
    notifyListeners();
  }
}
