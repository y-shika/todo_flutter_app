class TodoEntity {
  TodoEntity(this.title, this.active, this.detail, this.id);

  final String title;
  bool active;
  final String detail;
  final String id;

  Map<String, Object> toJson() {
    return {
      'title': title,
      'active': active,
      'detail': detail,
      'id': id,
    };
  }

  static TodoEntity fromJson(Map<String, Object> json) {
    return TodoEntity(
      json['title'] as String,
      json['active'] as bool,
      json['detail'] as String,
      json['id'] as String,
    );
  }
}