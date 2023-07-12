// ignore_for_file: non_constant_identifier_names, public_member_api_docs
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'repository_overview.dart';

final repositoryOverviewDataSourceProvider =
    Provider((ref) => RepositoryOverviewDataSource());

class RepositoryOverviewDataSource {
  Future<List<RepositoryOverview>> searchRepositoryOverviewWithCursor(
    String repositoryQuery,
    int page,
    int itemsPerPage,
  ) async {
    // 空白をクエリ用に+に変換する処理
    // if (repositoryQuery.substring(0, 0).isEmpty) {
    //   final query = repositoryQuery.replaceFirst(' ', '');
    //   repositoryQuery = query;
    // }
    // if (repositoryQuery.contains(' ')) {
    //   final query = repositoryQuery.replaceAll(' ', '+');
    //   repositoryQuery = query;
    // }

    final apiUrl =
        'https://api.github.com/search/repositories?q=$repositoryQuery&page=$page&per_page=$itemsPerPage';
    final apiUri = Uri.parse(apiUrl);
    final response = await http.get(apiUri);

    if (response.statusCode != 200) {
      throw Exception('No Repository: $repositoryQuery');
    }

    final jsonData = json.decode(response.body) as Map<String, dynamic>;
    final repositories = jsonData['items'] as List<dynamic>;
    return repositories
        .map(
          (repository) =>
              RepositoryOverview.fromJson(repository as Map<String, dynamic>),
        )
        .toList();
  }
}
