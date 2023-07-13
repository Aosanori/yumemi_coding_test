// ignore_for_file: public_member_api_docs

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository_overview/repository_overview.dart';
import '../repository_overview/repository_overview_data_source.dart';
import '../utils/environment_variables.dart';

final searchRepositoryStateNotifierProvider = StateNotifierProvider<
    SearchRepositoryStateNotifier,
    AsyncValue<List<RepositoryOverview>>?>((ref) {
  return SearchRepositoryStateNotifier(
    ref.read(repositoryOverviewDataSourceProvider),
  );
});

class SearchRepositoryStateNotifier
    extends StateNotifier<AsyncValue<List<RepositoryOverview>>?> {
  SearchRepositoryStateNotifier(this.repositoryOverviewDataSource)
      : super(null);
  final RepositoryOverviewDataSource repositoryOverviewDataSource;

  /// 検索クエリを途中で変えられたら、2ページ目から変えられたクエリで結果を取得する動作を回避するために
  /// submitされた値を一旦保持しておくためのメンバ
  String lastSearchRepositoryQuery = '';

  Future<void> searchRepositoryOverviewOnSubmit(String repositoryQuery) async {
    state = const AsyncValue.loading();
    lastSearchRepositoryQuery = repositoryQuery;
    await searchRepositoryOverview();
  }

  Future<void> searchRepositoryOverview() async {
    final repositoryQuery = lastSearchRepositoryQuery;
    try {
      final nextPage = (state?.value?.length ?? 0) ~/ numOfDataOnceFetching + 1;
      final newRepositoryOverviewResults =
          await repositoryOverviewDataSource.searchRepositoryOverviewWithCursor(
        repositoryQuery,
        // cursorの役割を果たしている
        nextPage,
        numOfDataOnceFetching,
      );
      state = AsyncValue.data(
        [...state?.value ?? [], ...newRepositoryOverviewResults],
      );
    } on Exception catch (error, stackTrace) {
      // 検索結果の最後まで行った場合はエラーで置き換えられないように
      if ((state?.value ?? []).isEmpty) {
        state = AsyncValue.error(error, stackTrace);
      }
    }
  }
}
