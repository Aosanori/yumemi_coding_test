import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_coding_test/repository_overview/repository_overview_data_source.dart';

void main() {
  final container = ProviderContainer();
  final repositoryOverviewDataSource =
      container.read(repositoryOverviewDataSourceProvider);

  test('search repository', () async {
    final results = await repositoryOverviewDataSource
        .searchRepositoryOverviewWithCursor('test', 1, 3);
    expect(results.first.owner.login.runtimeType, String);
    expect(results.length, 3);
  });
}
