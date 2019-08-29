import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_flutter_app/models/global_models.dart';
import 'package:my_flutter_app/models/todo_models.dart';
import 'package:provider/provider.dart';
import 'package:my_flutter_app/screens/profiles.dart';
import 'package:my_flutter_app/screens/time_select.dart';
import 'package:my_flutter_app/screens/todo_list.dart';
import 'package:my_flutter_app/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:my_flutter_app/widgets/bottom_navigation_widget/bottom_navigation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 主页
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Main();
  }
}

class Main extends StatefulWidget {
  _Main createState() => _Main();
}

class _Main extends State<Main> {
  final List<Widget> _children= [TimeSelect(), TodoList(), Profiles()];

  @override
  void initState() {
    super.initState();
    _loadingTodoData();
  }
  /// 初始化数据
  void _loadingTodoData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var todoModels = Provider.of<TodoModels>(context);
    var todoList = prefs.getStringList('todoList') ?? [];
    todoList.forEach((todo) => todoModels.addTodo(todo));

    var finishTodoList = prefs.getStringList('finishTodoList') ?? [];
    finishTodoList.forEach((todo) => todoModels.addFinishedTodo(todo));
  }

  @override
  Widget build(BuildContext context) {
    var globalModels = Provider.of<GlobalModels>(context);
    return Scaffold(
      appBar: AppBarWidget(),
      body: IndexedStack(
        index: globalModels.tabIndex,
        children: _children,
      ),
      bottomNavigationBar: BottomNavigation()
    );
  }
}
