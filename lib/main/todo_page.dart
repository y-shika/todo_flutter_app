import 'package:flutter/material.dart';

import 'todo_list.dart';

/// TODOアプリのベースとなるページクラス
class TodoPage extends StatelessWidget {
  final todoListKey = new GlobalKey<TodoListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO App"),
      ),
      body: TodoList(key: todoListKey),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add_circle),
        label: Text("Add TODO"),
        onPressed: () {
          print("Press FloatingButton");
          todoListKey.currentState.addTodoElement();
        },
      ),
    );
  }
}
