import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_flutter_app/redux/action/actions.dart';
import 'package:todo_flutter_app/redux/state/app_state.dart';
import 'package:todo_flutter_app/ui/widgets/todo_element.dart';

import 'models/todo.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key key, this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'TODO App',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('TODO App'),
          ),
          body: StoreConnector<AppState, List<Todo>>(
            converter: (store) => store.state.todoList,
            builder: (context, todoList) => ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return TodoElement(
                  todo: todoList[index],
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            icon: Icon(Icons.add_circle),
            label: const Text('Add TODO'),
            onPressed: () {
              store.dispatch(AddTodoAction(Todo(
                'Title${store.state.todoList.length}',
              )));
            },
          ),
        ),
      ),
    );
  }
}
