import 'package:redux/redux.dart';
import 'package:todo_flutter_app/models/todo_entity.dart';
import 'package:todo_flutter_app/redux/action/actions.dart';

// Reducerは新たなStateを発行して送る
final todoListReducer = combineReducers<List<TodoEntity>>([
  TypedReducer<List<TodoEntity>, AddTodoAction>(_addTodo),
  TypedReducer<List<TodoEntity>, InvertTodoAction>(_invertTodo),
]);

List<TodoEntity> _addTodo(List<TodoEntity> todoList, AddTodoAction action) {
  return List.from(todoList)..add(action.todo);
}

List<TodoEntity> _invertTodo(
    List<TodoEntity> todoList, InvertTodoAction action) {
  return todoList
      .map((todo) {
        if(todo.id == action.todoId) {
          todo.active = !todo.active;
        }
        return todo;
      })
      .toList();
}
