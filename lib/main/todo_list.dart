import 'package:flutter/material.dart';
import 'package:todo_flutter_app/main/todo_bloc_provider.dart';

import 'todo_element.dart';

/// TODOリストを表示するクラス
class TodoList extends StatelessWidget {
  const TodoList({@required this.bloc});

  final TodoBloc bloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<void>(
      //initialData: 0,
      stream: bloc.onChange,
      builder: (context, snapshot) {
        print('TodoList builder!');

        return ListView.builder(
          itemCount: bloc.todoList.length,
          itemBuilder: (context, index) {
            print('Reached itemBuilder');
            return TodoElement(todo: bloc.todoList[index]);
          },
        );
      },
    );
  }
}
