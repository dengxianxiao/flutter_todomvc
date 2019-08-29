import 'package:flutter/material.dart';
import 'package:my_flutter_app/models/todo_models.dart';
import 'package:my_flutter_app/screens/finish_todo_list.dart';
import 'package:provider/provider.dart';
import 'package:my_flutter_app/models/global_models.dart';

// 路由
import 'package:my_flutter_app/screens/home.dart';
import 'package:my_flutter_app/screens/add_todo.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => GlobalModels()),
        ChangeNotifierProvider(builder: (context) => TodoModels(),)
      ],
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter todoMVC',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/finishTodoList': (context) => FinishTodoList(),
        '/addTodo': (context) => AddTodo()
      },
    );
  }
}
