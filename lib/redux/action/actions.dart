import 'package:todo_flutter_app/models/todo.dart';

class AddTodoAction {
  AddTodoAction(
    this.todo,
  );

  final Todo todo;
}

class InvertTodoAction {
  InvertTodoAction(
    this.todoId,
    //this.invertedTodo,
  );

  final String todoId;
  // TODO: 上手くいかなかったらdispatch時にinvertedTodoを指定する
  //final TodoEntity invertedTodo;
}