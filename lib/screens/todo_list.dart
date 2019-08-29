import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_flutter_app/models/todo_models.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TodoListStateful(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/addTodo'),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      )
    );
  }
}

class TodoListStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TodoListState();
  }

}

class TodoListState extends State<TodoListStateful> {
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
            if (index >= todoModels.getTodoList.length) {
              return null;
            }
            return _buildRow(todoModels.getTodoList[index]);
          },
          /**
           * https://github.com/flutter/flutter/issues/15923
           *
           * ══╡ EXCEPTION CAUGHT BY RENDERING LIBRARY ╞═════════════════════════════════════════════════════════
           * I/flutter (29119): The following assertion was thrown during performLayout():
           * I/flutter (29119): 'package:flutter/src/rendering/sliver_multi_box_adaptor.dart': Failed assertion: line 556 pos 16:
           * I/flutter (29119): 'indexOf(child) == index': is not true.
           */
          itemCount: todoModels.getTodoList.length * 2,
        );
      },
    );
  }

  Widget _buildRow(todo) {
    var todoModels = Provider.of<TodoModels>(context);
    return ListTile(
      // leading: Checkbox(
      //   value: check,
      //   onChanged: (bool val) {
      //     setState(() {
      //       check = !check;
      //      print(val);
      //     });
      //   },
      //   checkColor: Colors.blue,
      //   activeColor: Colors.green,
      // ),
      title: Text(
        todo,
        style: _biggerFont,
      ),
      trailing: new Icon(Icons.done),
      onTap: () {
        setState(() {
          todoModels.deleteTodo(todo);
          todoModels.addFinishedTodo(todo);
        });
      },
    );
  }
}
