import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:todo_flutter_app/app.dart';
import 'package:todo_flutter_app/redux/middleware/store_todo_middleware.dart';
import 'package:todo_flutter_app/redux/reducer/app_state_reducer.dart';
import 'package:todo_flutter_app/redux/state/app_state.dart';
import 'package:todo_flutter_app/repositories/todo_list_repository_impl.dart';

Future<void> main() async {
  // この一文が無いと動かなさそう
  // https://twitter.com/_mono/status/1165511095949283328
  WidgetsFlutterBinding.ensureInitialized();

  runApp(TodoApp(
    store: Store<AppState>(
      appReducer,
      // TODO: ここのinitialStateに`AppState.loading()`を入れたら良さそう
      //       最低限の機能を作り終えたらやる
      initialState: const AppState(todoList: []),
      middleware: createStoreTodoMiddleware(TodoListRepositoryImpl()),
    ),
  ));
}
