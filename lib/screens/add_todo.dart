import 'package:flutter/material.dart';
import 'package:my_flutter_app/models/todo_models.dart';
import 'package:provider/provider.dart';

/// 新增待办事项
class AddTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AddTodoStateful();
  }
}

class AddTodoStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddTodoState();
  }

}

class AddTodoState extends State<AddTodoStateful> {
  final _formKey = GlobalKey<FormState>();
  String _todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新增待办'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.text_fields),
                hintText: '请输入待办事项'
              ),
              onSaved: (String value) {
                _todo = value.trim();
              },
              validator: (String value) {
                if (value.isEmpty) {
                  return '请输入待办事项';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    // Process data.
                    _formKey.currentState.save();
                    var todoModels = Provider.of<TodoModels>(context);
                    todoModels.addTodo(_todo);
                    Navigator.pop(context);
                  }
                },
                child: Text('提交'),
              ),
            ),
          ],
        ),
      )
    );
  }

}
