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

/// TODO要素を表示するクラス
class TodoElement extends StatefulWidget {
  TodoElement({@required this.todo});

  final Todo todo;

  @override
  _TodoElementState createState() => _TodoElementState();
}

class _TodoElementState extends State<TodoElement> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("tapped!! (Stateful)");
        setState(() {
          widget.todo.active = !widget.todo.active;
        });
      },
      child: Card(
        child: Padding(
          child: Text(
            widget.todo.title,
            style: TextStyle(
              color: Colors.white,
              decoration: widget.todo.active
                  ? TextDecoration.none
                  : TextDecoration.lineThrough,
            ),
          ),
          padding: EdgeInsets.all(20.0),
        ),
        color: widget.todo.active ? Colors.blue : Colors.black12,
      ),
    );
  }
}
