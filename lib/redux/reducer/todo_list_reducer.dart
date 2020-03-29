import 'package:redux/redux.dart';
import 'package:todo_flutter_app/models/todo_entity.dart';
import 'package:todo_flutter_app/redux/action/actions.dart';

// Reducerは新たなStateを発行して送る
final todoListReducer = combineReducers<List<TodoEntity>>([
  TypedReducer<List<TodoEntity>, AddTodoAction>(_setTodoList),
]);

List<TodoEntity> _setTodoList(List<TodoEntity> todoList, AddTodoAction action) {
  final newList = <TodoEntity>[]
    ..addAll(todoList)
    ..add(action.todo);

  return newList;
}