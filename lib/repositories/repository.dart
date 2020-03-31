import 'package:todo_flutter_app/models/github_result_dto.dart';
import 'package:todo_flutter_app/repositories/http/github_http_client.dart';
import 'package:todo_flutter_app/repositories/todo_entity.dart';
import 'package:todo_flutter_app/repositories/todo_list_repository.dart';

// 試しのGithub apiを叩くための実装
class GithubRepositoryImpl implements TodoListRepository {
  final GithubHttpClient client = GithubHttpClient();

  @override
  Future<GithubResultDto> fetch() {
    return client.fetch();
  }

  @override
  Future<List<TodoEntity>> loadTodoList() {
    // TODO: implement loadTodoList
    print('Debug: GithubRepositoryImpl loadTodoList is called!');
    return null;
  }

  @override
  Future saveTodoList(List<TodoEntity> todoList) {
    // TODO: implement saveTodoList
    print('Debug: GithubRepositoryImpl saveTodoList is called!');
    return null;
  }
}
