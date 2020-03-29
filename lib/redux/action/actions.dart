import 'package:todo_flutter_app/models/todo_entity.dart';

class AddTodoAction {
  AddTodoAction(
    this.todo,
  );

  final TodoEntity todo;
}