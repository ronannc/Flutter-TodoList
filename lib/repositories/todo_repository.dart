import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/models/item.dart';

class TodoRepository{
  late SharedPreferences sharedPreferences;

  Future<List<Item>> getTodoList() async{
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString('todo_list') ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => Item.fromJson(e)).toList();
  }

  void saveTodoList(List<Item> todos){
    final String jsonString = json.encode(todos);
    sharedPreferences.setString('todo_list', jsonString);
  }
}