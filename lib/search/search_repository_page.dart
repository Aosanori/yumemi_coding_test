import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../components/network_error_widget.dart';
import '../components/no_result_widget.dart';
import '../components/unknown_error_widget.dart';
import 'repository_list_view.dart';
import 'search_repository_query_form.dart';
import 'search_repository_state_notifier.dart';

class SearchRepositoryPage extends ConsumerWidget {
  const SearchRepositoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchRepositoryOverviewState =
        ref.watch(searchRepositoryStateNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanded Column Sample'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SearchRepositoryQueryForm(),
            Expanded(
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
                        ? RepositoryListView(repositoryList)
                        : const Center(child: NoResultsWidget()),
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) => error is http.ClientException
                      ? const Center(child: NetworkErrorWidget())
                      : const Center(child: UnknownErrorWidget()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
