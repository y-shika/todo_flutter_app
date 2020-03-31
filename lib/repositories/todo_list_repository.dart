import 'package:todo_flutter_app/models/github_result_dto.dart';
import 'package:todo_flutter_app/repositories/todo_entity.dart';

abstract class TodoListRepository {
  Future<List<TodoEntity>> loadTodoList();

  Future saveTodoList(List<TodoEntity> todoList);

  Future<GithubResultDto> fetch();
}
