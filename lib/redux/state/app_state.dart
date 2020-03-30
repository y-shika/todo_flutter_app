import 'package:flutter/foundation.dart';
import 'package:todo_flutter_app/models/todo.dart';

// 唯一の状態クラス
@immutable
class AppState {
  const AppState({
    this.todoList,
  });

  final List<Todo> todoList;
}