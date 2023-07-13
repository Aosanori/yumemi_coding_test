import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../components/network_error_widget.dart';
import '../components/no_result_widget.dart';
import '../components/unknown_error_widget.dart';
import 'repository_list_tile.dart';
import 'search_repository_state_notifier.dart';

class RepositoryListView extends ConsumerWidget {
  const RepositoryListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchRepositoryOverviewState =
        ref.watch(searchRepositoryStateNotifierProvider);
    if (searchRepositoryOverviewState == null) {
      return Container();
    }
    return Expanded(
      child: Container(
        child: searchRepositoryOverviewState.when(
          data: (repositoryList) {
            if (repositoryList.isEmpty) {
              return const Center(child: NoResultsWidget());
            }
            return LazyLoadScrollView(
              onEndOfPage: () {
                final notifier = ref.read(
                  searchRepositoryStateNotifierProvider.notifier,
                );
                notifier.searchRepositoryOverview();
              },
              child: ListView.builder(
                itemCount: repositoryList.length,
                itemBuilder: (context, index) {
                  return RepositoryListTile(repositoryList[index]);
                },
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) {
            if (error is http.ClientException) {
              return const Center(child: NetworkErrorWidget());
            }
            return const Center(child: UnknownErrorWidget());
          },
        ),
      ),
    );
  }
}
