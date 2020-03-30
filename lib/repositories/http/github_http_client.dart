import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_flutter_app/models/github_result_dto.dart';

class GithubHttpClient {
  static const _BASE_URL = 'https://api.github.com';

  Future<GithubResultDto> fetch() async {
    final response = await http.get('$_BASE_URL/users/octocat');
    final dynamic responseJson = json.decode(response.body);
    return GithubResultDto.fromJson(responseJson as Map<String, dynamic>);
  }
}
