import 'dart:convert';

import 'package:key_value_store/key_value_store.dart';
import 'package:todo_flutter_app/repositories/todo_entity.dart';
import 'package:todo_flutter_app/repositories/todo_list_repository.dart';

class KeyValueStorage implements TodoListRepository {
  const KeyValueStorage(
    this.key,
    this.store,
    [this.codec = json]
  );

  final String key;
  final KeyValueStore store;
  final JsonCodec codec;

  @override
  Future<List<TodoEntity>> loadTodoList() async {
    return codec
      .decode(store.getString(key))['todoList']
      .cast<Map<String, Object>>()
      // TODO: fromJsonをTodoEntityに生やしてそれを呼ぶ
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
  
}