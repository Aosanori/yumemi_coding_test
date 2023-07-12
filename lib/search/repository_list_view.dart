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
    return Expanded(
      child: Container(
        child: searchRepositoryOverviewState.when(
          data: (repositoryList) => LazyLoadScrollView(
            onEndOfPage: () {
              final notifier = ref.read(
                searchRepositoryStateNotifierProvider.notifier,
              );
              notifier.searchRepositoryOverview();
            },
            child: repositoryList.isNotEmpty
                ? ListView.builder(
                    itemCount: repositoryList.length,
                    itemBuilder: (context, index) {
                      return RepositoryListTile(repositoryList[index]);
                    },
                  )
                : const Center(child: NoResultsWidget()),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => error is http.ClientException
              ? const Center(child: NetworkErrorWidget())
              : const Center(child: UnknownErrorWidget()),
        ),
      ),
    );
  }
}
