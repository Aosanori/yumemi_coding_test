// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository_overview/repository_overview.dart';
import '../repository_overview/repository_overview_data_source.dart';

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
  final TextEditingController queryTextController = TextEditingController();

  /// 検索クエリを途中で変えられたら、2ページ目から変えられたクエリで結果を取得する動作を回避するために
  /// submitされた値を一旦保持しておくためのメンバ
  String lastSearchRepositoryQuery = '';

  Future<void> searchRepositoryOverviewOnSubmit() async {
    state = const AsyncValue.loading();
    lastSearchRepositoryQuery = queryTextController.text;
    await searchRepositoryOverview();
  }

  Future<void> searchRepositoryOverview() async {
    final repositoryQuery = lastSearchRepositoryQuery;
    try {
      final newRepositoryOverviewResults =
          await repositoryOverviewDataSource.searchRepositoryOverviewWithCursor(
        repositoryQuery,
        (state?.value?.length ?? 0) ~/ 15 + 1, // cursorの役割を果たしている
        15,
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
