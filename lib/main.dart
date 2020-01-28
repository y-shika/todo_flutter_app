import 'package:flutter/material.dart';
import 'package:todo_flutter_app/main/todo_bloc_provider.dart';

import 'main/todo_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App',
      home: TodoBlocProvider(
        child: TodoScreen(),
      ),
    );
  }
}
