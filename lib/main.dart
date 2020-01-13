import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
          _todoElement("TODO_1"),
          _todoElement("TODO_2"),
        ],
      ),
    );
  }

  Widget _todoElement(String todoTitle) {
    return Card(
      child: Padding(
        child: Text(todoTitle),
        padding: EdgeInsets.all(20.0),
      ),
    );
  }
}
