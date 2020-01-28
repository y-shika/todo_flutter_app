import 'package:flutter/material.dart';
import 'package:todo_flutter_app/main/todo_list.dart';

import 'todo_bloc_provider.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = TodoBlocProvider.of(context).bloc;

    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO App'),
      ),
      body: TodoList(bloc: bloc),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add_circle),
        label: const Text('Add TODO'),
        onPressed: () {
          print('Press FloatingActionButton');
          bloc.onAdd.add(null);
        },
      ),
    );
  }
}
