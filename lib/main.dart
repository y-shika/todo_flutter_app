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

class TodoPage extends StatefulWidget {
  final _todos = <Todo>[];

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO App"),
      ),
      body: TodoElements(todoElements: widget._todos),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle),
        onPressed: () {
          print("press floatbutton: ${widget._todos.length}");
          setState(() {
            widget._todos.add(new Todo("TODO", true));
          });
        },
      ),
    );
  }
}

class TodoElements extends StatelessWidget {
  TodoElements({@required this.todoElements});

  final List<Todo> todoElements;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoElements.length,
      itemBuilder: (context, index) {
        return TodoElement(todo: todoElements[index]);
      },
    );
  }
}

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
