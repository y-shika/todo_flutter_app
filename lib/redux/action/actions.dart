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
  );

  final String todoId;
}