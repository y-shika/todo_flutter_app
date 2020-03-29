class TodoEntity {
  const TodoEntity(
    this.title,
    this.detail,
  );

  final String title;
  final String detail;
  // TODO : よくわからん 問題があれば修正する
  final bool active = true;
}
