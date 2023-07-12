// ignore_for_file: public_member_api_docs

// ignore: implementation_imports
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

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
                      obscureText: false,
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
                  data: (data) => LazyLoadScrollView(
                    onEndOfPage: () {
                      final notifier = ref.read(
                        searchRepositoryStateNotifierProvider.notifier,
                      );
                      notifier
                          .searchRepositoryOverview(_queryTextController.text);
                    },
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: InkWell(
                            onTap: () {},
                            child: ListTile(
                              title: Text(data[index].name),
                              subtitle: Text(
                                '★${data[index].stargazers_count}',
                              ),
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(data[index].owner.avatar_url),
                              ),
                              //trailing: Icon(icons[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) => Text(error.toString()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
