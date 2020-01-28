import 'dart:async';

import 'package:todo_flutter_app/main/todo.dart';

class TodoBloc {
  TodoBloc() {
    _pressAddButtonController.stream.listen((_) {
      print('Listen! Press AddButton!');

      todoList.add(Todo('HOGE', 'FUGA'));
      _todoListController.sink.add(null);
    });
  }

  final _pressAddButtonController = StreamController<void>();
  final _todoListController = StreamController<void>();

  StreamSink<void> get onAdd => _pressAddButtonController.sink;

  Stream<void> get onChange => _todoListController.stream;

  List<Todo> todoList = <Todo>[];

  void dispose() {
    _pressAddButtonController.close();
    _todoListController.close();
  }
}
