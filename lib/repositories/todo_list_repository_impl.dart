import 'package:todo_flutter_app/models/todo_dto.dart';
import 'package:todo_flutter_app/repositories/http/todo_list_http_client.dart';
import 'package:todo_flutter_app/repositories/todo_entity.dart';
import 'package:todo_flutter_app/repositories/todo_list_repository.dart';

class TodoListRepositoryImpl implements TodoListRepository {
  final TodoListHttpClient client = TodoListHttpClient();

  @override
  Future<List<TodoDto>> fetch() {
    return client.fetch();
  }

  @override
  Future<List<TodoEntity>> loadTodoList() {
    // TODO: implement loadTodoList
    print('Debug: TodoListRepositoryImpl loadTodoList is called!');
    return null;
  }

  @override
  Future saveTodoList(List<TodoEntity> todoList) {
    // TODO: implement saveTodoList
    print('Debug: TodoListRepositoryImpl saveTodoList is called!');
    return null;
  }
}