import 'package:uuid/uuid.dart';

class TodoEntity {
  TodoEntity(this.title, {this.active = true, String detail, String id})
    : detail = detail ?? '',
      id = id ?? Uuid().v4();

  final String title;
  bool active;
  final String detail;
  final String id;

  // TODO: copyWithなどを実装した方が良いかも？
}
