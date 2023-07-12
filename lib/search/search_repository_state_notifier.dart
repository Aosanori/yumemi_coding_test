// ignore_for_file: public_member_api_docs

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository_overview/repository_overview.dart';
import '../repository_overview/repository_overview_data_source.dart';

final searchRepositoryStateNotifierProvider = StateNotifierProvider<
    SearchRepositoryStateNotifier, AsyncValue<List<RepositoryOverview>>>((ref) {
  return SearchRepositoryStateNotifier(
    ref.read(repositoryOverviewDataSourceProvider),
  );
});

class SearchRepositoryStateNotifier
    extends StateNotifier<AsyncValue<List<RepositoryOverview>>> {
  SearchRepositoryStateNotifier(this.repositoryOverviewDataSource)
      : super(
          const AsyncValue.data(<RepositoryOverview>[]),
        );
  final RepositoryOverviewDataSource repositoryOverviewDataSource;

  Future<void> searchRepositoryOverview(
    String repositoryQuery,
  ) async {
    if ((state.value ?? []).isEmpty) {
      state = const AsyncValue.loading();
    }
    try {
      final newRepositoryOverviewResults =
          await repositoryOverviewDataSource.searchRepositoryOverviewWithCursor(
        repositoryQuery,
        state.value?.length ?? 0 ~/ 15,
        15,
      );
      state = AsyncValue.data(
        [...state.value ?? [], ...newRepositoryOverviewResults],
      );
    } on Exception catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
