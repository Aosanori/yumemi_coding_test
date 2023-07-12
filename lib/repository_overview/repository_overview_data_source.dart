// ignore_for_file: non_constant_identifier_names, public_member_api_docs
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/api_client.dart';
import '../utils/environment_variables.dart';
import 'repository_overview.dart';

final repositoryOverviewDataSourceProvider = Provider(
  (ref) => RepositoryOverviewDataSource(
    ref.read(apiClientProvider),
  ),
);

class RepositoryOverviewDataSource {
  RepositoryOverviewDataSource(this.apiClient);
  final APIClient apiClient;

  Future<List<RepositoryOverview>> searchRepositoryOverviewWithCursor(
    String repositoryQuery,
    int page,
    int itemsPerPage,
  ) async {
    final apiUrl =
        generateURLFromSearchQuery(repositoryQuery, page, itemsPerPage);
    final jsonData = await apiClient.fetchData(apiUrl);
    final repositories = jsonData['items'] as List<dynamic>;
    return repositories
        .map(
          (repository) =>
              RepositoryOverview.fromJson(repository as Map<String, dynamic>),
        )
        .toList();
  }
}
