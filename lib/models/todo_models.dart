import 'package:flutter/material.dart';
import 'package:my_flutter_app/db/db.dart';

class TodoModels extends ChangeNotifier {
  final List<String> _todoList = [];
  final List<String> _finishedTodoList = [];

  List<String> get getTodoList => _todoList;

  List<String> get getFinishedTodoList => _finishedTodoList;

  // 新增待办
  void addTodo (String todo) {
    if (_todoList.contains(todo)) {
      return;
    }
    _todoList.add(todo);
    notifyListeners();
    var db = new DataBase();
    db.setTodoList(_todoList);
  }

  /// 删除待办
  void deleteTodo (String todo) {
    _todoList.remove(todo);
    notifyListeners();
    var db = new DataBase();
    db.setTodoList(_todoList);
  }

  /// 新增已完成事项
  void addFinishedTodo (String todo) {
    if (_finishedTodoList.contains(todo)) {
      return;
    }
    _finishedTodoList.add(todo);
    notifyListeners();
    var db = new DataBase();
    db.setFinishTodoList(_finishedTodoList);
  }

  /// 删除已完成事项
  void deleteFinishedTodo (String todo) {
    _finishedTodoList.remove(todo);
    notifyListeners();
    var db = new DataBase();
    db.setFinishTodoList(_finishedTodoList);
  }
}
