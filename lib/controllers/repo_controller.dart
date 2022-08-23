import 'dart:convert';

import 'package:flutter_web_portfolio/models/repo_model.dart';
import 'package:http/http.dart' as http;

class RepoController {
  static Future<List<RepoModel>> getPinnedRepos() async {
    List<RepoModel> repoList;
    Map<String, dynamic> queryParameters = {
      'username': 'coskuncay',
    };
    var url = Uri.https(
      'gh-pinned-repos.egoist.dev',
      '/',
      queryParameters,
    );
    final res = await http.post(
      url,
    );
    if (res.statusCode == 200) {
      final decodedData = utf8.decode(res.bodyBytes);
      var data = jsonDecode(decodedData);

      final items = data.cast<Map<String, dynamic>>();
      repoList = List<RepoModel>.from(
        items.map(
          (itemsJson) => RepoModel.fromJsonModel(itemsJson),
        ),
      );
      return repoList;
    } else {
      return [];
    }
  }
}
