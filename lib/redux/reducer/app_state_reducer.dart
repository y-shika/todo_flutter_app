import 'package:todo_flutter_app/redux/reducer/todo_list_reducer.dart';
import 'package:todo_flutter_app/redux/state/app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    todoList: todoListReducer(state.todoList, action),
  );
}