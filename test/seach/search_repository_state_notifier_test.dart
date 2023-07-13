import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_coding_test/search/search_repository_state_notifier.dart';

void main() {
  final container = ProviderContainer();

  test('初期状態', () async {
    final state = container.read(searchRepositoryStateNotifierProvider);
    expect(state, null);
  });
  test('testと検索する', () async {
    await container
        .read(searchRepositoryStateNotifierProvider.notifier)
        .searchRepositoryOverviewOnSubmit('test');
    final state = container.read(searchRepositoryStateNotifierProvider);
    expect(state!.value!.length, 15);
  });

  test('遅延読み込み時', () async {
    await container
        .read(searchRepositoryStateNotifierProvider.notifier)
        .searchRepositoryOverview();
    final state = container.read(searchRepositoryStateNotifierProvider);
    expect(state!.value!.length, 30);
  });

  test('新たに検索ワードを入れた時', () async {
    await container
        .read(searchRepositoryStateNotifierProvider.notifier)
        .searchRepositoryOverviewOnSubmit('aaa');
    final state = container.read(searchRepositoryStateNotifierProvider);
    expect(state!.value!.length, 15);
  });
}
