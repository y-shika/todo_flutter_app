// TODO: ひとまずファイル名、クラス名は仮決め 理解してから修正する

import 'package:redux/redux.dart';
import 'package:todo_flutter_app/redux/action/actions.dart';
import 'package:todo_flutter_app/redux/selectors/selectors.dart';
import 'package:todo_flutter_app/redux/state/app_state.dart';
import 'package:todo_flutter_app/repositories/todo_list_repository.dart';

List<Middleware<AppState>> createStoreTodoMiddleware(
  TodoListRepository repository,
) {
  final saveTodoList = _createSaveTodoList(repository);

  return [
    TypedMiddleware<AppState, AddTodoAction>(saveTodoList),
    TypedMiddleware<AppState, InvertTodoAction>(saveTodoList),
  ];
}

Middleware<AppState> _createSaveTodoList(TodoListRepository repository) {
  return (store, dynamic action, next) {
    // TODO: Debugメッセージ 後に消す
    print('Debug: middleware _createSaveTodoList is called!');

    // TODO: 取得できることを確認した後に正しい実装に変えたりする
    // apiレスポンスをmiddlewareで取得できるかのテスト
    repository.fetch().then((dto) {
      print('login: ${dto.login}\nid: ${dto.id}\navatar_url: ${dto.avatarUrl}');
    });

    next(action);
    repository.saveTodoList(
      todoListSelector(store.state).map((todo) => todo.toEntity()).toList(),
    );
  };
}