class TodoEntity {
  TodoEntity(this.title, this.active, this.detail, this.id);

  TodoEntity.fromJson(Map<String, Object> json)
      : title = json['title'] as String,
        active = json['active'] as bool,
        detail = json['detail'] as String,
        id = json['id'] as String;

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
}
