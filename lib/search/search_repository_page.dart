import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../components/network_error_widget.dart';
import '../components/no_result_widget.dart';
import '../components/unknown_error_widget.dart';
import 'repository_list_view.dart';
import 'search_repository_state_notifier.dart';

class SearchRepositoryPage extends ConsumerWidget {
  SearchRepositoryPage({super.key});
  final TextEditingController _queryTextController = TextEditingController();

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
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 10,
                      bottom: 15,
                    ),
                    child: TextField(
                      controller: _queryTextController,
                      enabled: true,
                      // style: TextStyle(eee
                      //     color:
                      //         widget.isDarkMode ? Colors.white : Colors.black),
                      // obscureText: false,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      final notifier = ref.read(
                        searchRepositoryStateNotifierProvider.notifier,
                      );
                      notifier.resetList();
                      notifier
                          .searchRepositoryOverview(_queryTextController.text);
                    },
                    child: const Text('Search'),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: searchRepositoryOverviewState.when(
                  data: (repositoryList) => LazyLoadScrollView(
                    onEndOfPage: () {
                      final notifier = ref.read(
                        searchRepositoryStateNotifierProvider.notifier,
                      );
                      notifier
                          .searchRepositoryOverview(_queryTextController.text);
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
