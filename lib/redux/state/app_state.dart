import 'package:flutter/foundation.dart';
import 'package:todo_flutter_app/models/todo_entity.dart';

// 唯一の状態クラス
@immutable
class AppState {
  const AppState({
    this.todoList,
  });

  final List<TodoEntity> todoList;
}