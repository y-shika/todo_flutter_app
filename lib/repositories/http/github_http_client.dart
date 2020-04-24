import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_flutter_app/models/github_result_dto.dart';

class GithubHttpClient {
  static const _BASE_URL = 'https://api.github.com';

  Future<GithubResultDto> fetch() async {
    // TODO: 自分で作成したapi (todo-golang-api) のクライアントクラスを作る
    //       そのため下のコメントアウトは後に戻す
    //final response = await http.get('$_BASE_URL/users/octocat');
    final response = await http.get('https://todo-golang-api.herokuapp.com/api/github');
    final dynamic responseJson = json.decode(response.body);
    return GithubResultDto.fromJson(responseJson as Map<String, dynamic>);
  }
}
