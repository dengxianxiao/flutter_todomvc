import 'package:shared_preferences/shared_preferences.dart';

/// 持久化存储
class DataBase {
  setTodoList(List<String> todoList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('todoList', todoList);
  }
  getTodoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('todoList');
  }
  setFinishTodoList(List<String> finishTodoList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('finishTodoList', finishTodoList);
  }
  getFinishTodoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('finishTodoList');
  }
}
