import 'package:todo_flutter_app/repositories/todo_entity.dart';
import 'package:uuid/uuid.dart';

class Todo {
  Todo(this.title, {this.active = true, String detail, String id})
    : detail = detail ?? '',
      id = id ?? Uuid().v4();

  final String title;
  bool active;
  final String detail;
  final String id;

  // TODO: copyWithなどを実装した方が良いかも？

   TodoEntity toEntity() {
     return TodoEntity(title, active, detail, id);
   }
}
