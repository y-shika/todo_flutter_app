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

// これだと1要素を反転させるだけなのに全要素に対してリビルドがかかる
// しかしこれはReduxで構築する以上解決は難しいかもしれない
// (参考にしていたリポジトリでも同様の書き方をしているため)
// https://github.com/brianegan/flutter_architecture_samples/blob/master/redux/lib/reducers/todos_reducer.dart
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
