import 'package:flutter/foundation.dart';
import 'package:todo_flutter_app/models/github_result_dto.dart';
import 'package:todo_flutter_app/repositories/todo_entity.dart';
import 'package:todo_flutter_app/repositories/todo_list_repository.dart';

class LocalStorageRepository implements TodoListRepository {
  const LocalStorageRepository({
    @required this.localStorage,
  });

  final TodoListRepository localStorage;

  // TODO: ひとまずasync, awaitは付けないでおく 問題が発生したら見直す
  @override
  Future<List<TodoEntity>> loadTodoList() {
    // TODO: Debugメッセージ 後に消す
    print('Debug: repository loadTodoList is called!');
    return localStorage.loadTodoList();
  }

  // TODO: ひとまずasync, awaitは付けないでおく 問題が発生したら見直す
  @override
  Future saveTodoList(List<TodoEntity> todoList) {
    // TODO: Debugメッセージ 後に消す
    print('Debug: repository saveTodoList is called!');

    return Future.wait<dynamic>([
      localStorage.saveTodoList(todoList),
    ]);
  }

  @override
  Future<GithubResultDto> fetch() {
    // TODO: Debugメッセージ 後に消す
    print('Debug: repository fetch is called!');

    // TODO: 非同期にしなくて良い？動かなかったりしたら調べてみる
    return localStorage.fetch();
  }
}
