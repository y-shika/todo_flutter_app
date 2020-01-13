import 'package:flutter/material.dart';

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
          ListTile(
            title: Text("Tile_1"),
          ),
          ListTile(
            title: Text("Tile_2"),
          ),
        ],
      ),
    );
  }
}
