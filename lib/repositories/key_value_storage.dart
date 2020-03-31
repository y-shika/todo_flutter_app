import 'dart:convert';

import 'package:key_value_store/key_value_store.dart';
import 'package:todo_flutter_app/models/github_result_dto.dart';
import 'package:todo_flutter_app/repositories/http/github_http_client.dart';
import 'package:todo_flutter_app/repositories/todo_entity.dart';
import 'package:todo_flutter_app/repositories/todo_list_repository.dart';

class KeyValueStorage implements TodoListRepository {
  const KeyValueStorage(this.key, this.store, [this.codec = json]);

  final String key;
  final KeyValueStore store;
  final JsonCodec codec;

  @override
  Future<List<TodoEntity>> loadTodoList() async {
    return codec
        .decode(store.getString(key))['todoList']
        .cast<Map<String, Object>>()
        .map<TodoEntity>(TodoEntity.fromJson)
        .toList(growable: false) as List<TodoEntity>;
  }

  @override
  Future saveTodoList(List<TodoEntity> todoList) {
    return store.setString(
      key,
      codec.encode({
        'todos': todoList.map((todo) => todo.toJson()).toList(),
      }),
    );
  }

  // TODO: GithubのapiをfetchするのにKeyValueStorageクラスに実装はおかしい
  //       が、テストなのでひとまず試してみて動くことを確認してから適切な場所に実装を移す
  @override
  Future<GithubResultDto> fetch() {
    final client = GithubHttpClient();
    return client.fetch();
  }
}
