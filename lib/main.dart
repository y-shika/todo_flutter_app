import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_flutter_app/models/todo_entity.dart';
import 'package:todo_flutter_app/redux/action/actions.dart';
import 'package:todo_flutter_app/redux/reducer/app_state_reducer.dart';
import 'package:todo_flutter_app/redux/state/app_state.dart';
import 'package:todo_flutter_app/ui/widgets/todo_element.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: const AppState(todoList: []),
  );

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
          body: StoreConnector<AppState, List<TodoEntity>>(
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
          floatingActionButton: StoreConnector<AppState, Function()>(
            converter: (store) {
              return () => store.dispatch(AddTodoAction(TodoEntity(
                    'Title${store.state.todoList.length}',
                    'Detail${store.state.todoList.length}',
                  )));
            },
            builder: (context, callback) => FloatingActionButton(
              onPressed: callback,
              tooltip: 'Add TODO',
              child: Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}
