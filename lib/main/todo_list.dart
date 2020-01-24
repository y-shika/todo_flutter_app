import 'package:flutter/material.dart';

import 'todo.dart';
import 'todo_element.dart';

/// TODOリストを表示するクラス
class TodoList extends StatefulWidget {
  TodoList({Key key}) : super(key: key);

  final todoList = <Todo>[];

  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  void addTodoElement() {
    setState(() {
      widget.todoList.add(Todo("HOGE", "FUGA", true));
    });
  }

  void removeTodoElement(int index) {
    setState(() {
      widget.todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todoList.length,
      itemBuilder: (context, index) {
        return TodoElement(
            index: index,
            todo: widget.todoList[index],
            onRemove: removeTodoElement);
      },
    );
  }
}
