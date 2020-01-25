import 'package:flutter/material.dart';

import 'todo_list.dart';

/// TODOアプリのベースとなるページクラス
class TodoPage extends StatelessWidget {
  final GlobalKey<TodoListState> todoListKey = GlobalKey<TodoListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO App'),
      ),
      body: TodoList(key: todoListKey),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add_circle),
        label: const Text('Add TODO'),
        onPressed: () {
          print('Press FloatingButton');
          todoListKey.currentState.addTodoElement();
        },
      ),
    );
  }
}
