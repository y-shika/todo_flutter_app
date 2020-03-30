import 'package:todo_flutter_app/models/github_result_dto.dart';
import 'package:todo_flutter_app/repositories/todo_entity.dart';

abstract class TodoListRepository {
  Future<List<TodoEntity>> loadTodoList();

  Future saveTodoList(List<TodoEntity> todoList);

  // TODO: APIの取得テストのためにfetchを生やす 後々は別のrepositoryに切り出したりする
  // TODO: github apiで取れるレスポンスに合わせたクラスを作ってジェネリックの中に入れる
  Future<GithubResultDto> fetch();
}
