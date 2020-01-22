import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App',
      home: TodoScreen(),
    );
  }
}

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO App"),
      ),
      body: ListView(
        children: <Widget>[
          TodoStatelessElement(todoTitle: "TODO_1"),
          TodoStatelessElement(todoTitle: "TODO_2"),
          TodoStatefulElement(todoTitle: "TODO_3"),
          TodoStatefulElement(todoTitle: "TODO_4"),
        ],
      ),
    );
  }
}

// StatelessとStatefulで比較してみる

class TodoStatelessElement extends StatelessWidget {
  final String todoTitle;

  TodoStatelessElement({@required this.todoTitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("tapped!! (Stateless)");
      },
      child: Card(
        child: Padding(
          child: Text(todoTitle),
          padding: EdgeInsets.all(20.0),
        ),
      ),
    );
  }
}

class TodoStatefulElement extends StatefulWidget {
  TodoStatefulElement({Key key, @required this.todoTitle}) : super(key: key);

  final String todoTitle;

  @override
  _TodoStatefulElementState createState() => _TodoStatefulElementState();
}

class _TodoStatefulElementState extends State<TodoStatefulElement> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("tapped!! (Stateful)");
      },
      child: Card(
        child: Padding(
          child: Text(widget.todoTitle),
          padding: EdgeInsets.all(20.0),
        ),
      ),
    );
  }
}
