import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_flutter_app/models/todo_models.dart';
import 'package:provider/provider.dart';

/// 已完成列表
class FinishTodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('已完成列表'),
      ),
      body: FinishTodoListStateful()
    );
  }
}

class FinishTodoListStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FinishTodoListState();
  }

}

class FinishTodoListState extends State<FinishTodoListStateful> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoModels>(
      builder: (context, todoModels, child) {
        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, i) {
            if (i.isOdd) return Divider();
            final index = i ~/ 2;
            if (index >= todoModels.getFinishedTodoList.length) {
              return null;
            }
            return _buildRow(todoModels.getFinishedTodoList[index]);
          },
          /**
           * https://github.com/flutter/flutter/issues/15923
           *
           * ══╡ EXCEPTION CAUGHT BY RENDERING LIBRARY ╞═════════════════════════════════════════════════════════
           * I/flutter (29119): The following assertion was thrown during performLayout():
           * I/flutter (29119): 'package:flutter/src/rendering/sliver_multi_box_adaptor.dart': Failed assertion: line 556 pos 16:
           * I/flutter (29119): 'indexOf(child) == index': is not true.
           */
          itemCount: todoModels.getFinishedTodoList.length * 2,
        );
      },
    );
  }

  Widget _buildRow(todo) {
    return ListTile(
      title: Text(
        todo,
        style: _biggerFont,
      )
    );
  }
}
