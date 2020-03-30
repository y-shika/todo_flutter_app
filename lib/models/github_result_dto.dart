class GithubResultDto {
  const GithubResultDto({
    this.login,
    this.id,
    this.avatarUrl,
  });

  // factoryメソッドはインスタンスを生成しないコンストラクタ (自分でコンストラクタを生成する必要がある)
  factory GithubResultDto.fromJson(Map<String, dynamic> json) {
    return GithubResultDto(
      login: json['login'] as String,
      id: json['id'] as int,
      avatarUrl: json['avatar_url'] as String,
    );
  }

  final String login;
  // TODO: レスポンスを見た感じintっぽいが何か問題が発生したら見直して調べる
  final int id;
  final String avatarUrl;
}
