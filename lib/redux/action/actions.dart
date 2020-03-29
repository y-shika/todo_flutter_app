import 'package:todo_flutter_app/models/todo_entity.dart';

class AddTodoAction {
  AddTodoAction(
    this.todo,
  );

  final TodoEntity todo;
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