import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_flutter_app/models/todo_entity.dart';
import 'package:todo_flutter_app/redux/action/actions.dart';
import 'package:todo_flutter_app/redux/reducer/app_state_reducer.dart';
import 'package:todo_flutter_app/redux/state/app_state.dart';

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
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have pushed the button this many times'),
                StoreConnector<AppState, List<TodoEntity>>(
                  converter: (store) => store.state.todoList,
                  // TODO: ここではひとまずListの要素数を表示する 一区切りついたらList表示する
                  builder: (context, todoList) => Text(
                    'todoList length : ${todoList.length}',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: StoreConnector<AppState, Function()>(
            converter: (store) {
              return () => store.dispatch(AddTodoAction(const TodoEntity(
                    'Title',
                    'Detail',
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
