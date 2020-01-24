import 'package:flutter/material.dart';

import 'todo_page.dart';

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
