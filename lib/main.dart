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
          _decoratedListTile("Tile_1"),
          _decoratedListTile("Tile_2"),
        ],
      ),
    );
  }

  Widget _decoratedListTile(String tileName) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black38),
        ),
      ),
      child: ListTile(
        title: Text(tileName),
      ),
    );
  }
}
