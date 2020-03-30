import 'package:todo_flutter_app/models/todo.dart';
import 'package:todo_flutter_app/redux/state/app_state.dart';

List<Todo> todoListSelector(AppState state) => state.todoList;