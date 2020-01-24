import 'package:flutter/material.dart';

/// TODO要素用のクラス
class Todo {
  Todo(this.title, this.detail, this.active);

  String title;
  String detail;
  bool active;
}

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

// TODO: TODOElementもStatefulにしてtodoの中身をいじった方が良いかも
//       このときにTodoListから受け取ったtodoの中を変更するとリストの方にも変更があるか探る（ポインタかどうか。ポインタが良いな）
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
          child: Text(todo.title),
          padding: EdgeInsets.all(20.0),
        ),
      ),
    );
  }
}
