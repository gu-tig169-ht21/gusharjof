import 'dart:convert';
import 'package:http/http.dart' as http;
import 'todo_list_state.dart';

const url = 'https://todoapp-api-pyq5q.ondigitalocean.app';
const apiKey = 'fad5ed99-c5eb-4167-9df7-dc564bcebc69';

class TodoInternet {
  static Future<List<TodoItem>> getItems() async {
    var response = await http.get(
      Uri.parse('$url/todos?key=$apiKey'),
    );
    String bodyString = response.body;
    print(bodyString);
    var json = jsonDecode(bodyString);
    return json.map<TodoItem>(
      (data) {
        return TodoItem.fromJson(data);
      },
    ).toList();
  }

  static Future<List<TodoItem>> addTodo(TodoItem item) async {
    Map<String, dynamic> json = TodoItem.toJson(item);
    var bodyString = jsonEncode(json);
    var response = await http.post(
      Uri.parse('$url/todos?key=$apiKey'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = response.body;
    var list = jsonDecode(bodyString);
    return list.map<TodoItem>(
      (data) {
        return TodoItem.fromJson(data);
      },
    ).toList();
  }

  static Future deleteItem(String id) async {
    var response = await http.delete(
      Uri.parse('$url/todos/$id?key=$apiKey'),
    );
    var bodyString = response.body;
    var list = jsonDecode(bodyString);
    return list.map<TodoItem>(
      (data) {
        return TodoItem.fromJson(data);
      },
    ).toList();
  }

  static Future updateTodo(TodoItem item, newValue) async {
    String id = item.id;
    item.isChecked = newValue;
    Map<String, dynamic> json = TodoItem.toJson(item);
    var bodyString = jsonEncode(json);
    var response = await http.put(
      Uri.parse('$url/todos/$id?key=$apiKey'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = response.body;
    var list = jsonDecode(bodyString);
    return list.map<TodoItem>(
      (data) {
        return TodoItem.fromJson(data);
      },
    ).toList();
  }
}
