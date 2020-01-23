import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App',
      home: TodoPage(),
    );
  }
}

// Todo要素用のクラス
class Todo {
  Todo(this.todoTitle, this.active);

  String todoTitle;
  bool active;
}

/// TODOアプリのベースとなるページクラス
class TodoPage extends StatelessWidget {
  final todoListKey = new GlobalKey<_TodoListState>();

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

// TODO: 上手くStatefulで作れたらファイルを分ける
/// TODOリストを表示するクラス
class TodoList extends StatefulWidget {
  TodoList({Key key}) : super(key: key);

  final todoList = <Todo>[];

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  void addTodoElement() {
    setState(() {
      widget.todoList.add(Todo("TODO", true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todoList.length,
      itemBuilder: (context, index) {
        return TodoElement(todo: widget.todoList[index]);
      },
    );
  }
}

/// TODO要素を表示するクラス
class TodoElement extends StatelessWidget {
  TodoElement({@required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("tapped!!");
      },
      child: Card(
        child: Padding(
          child: Text(todo.todoTitle),
          padding: EdgeInsets.all(20.0),
        ),
      ),
    );
  }
}
