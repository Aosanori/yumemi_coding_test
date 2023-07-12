// ignore_for_file: public_member_api_docs

// ignore: implementation_imports
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

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
            SizedBox(
              height: 100,
              child: ElevatedButton(
                onPressed: () {
                  final notifier = ref.read(
                    searchRepositoryStateNotifierProvider.notifier,
                  );
                  notifier.searchRepositoryOverview('aaa');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  elevation: 16,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  'Get Result',
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: searchRepositoryOverviewState.when(
                  data: (data) => LazyLoadScrollView(
                    onEndOfPage: () {
                      final notifier = ref.read(
                        searchRepositoryStateNotifierProvider.notifier,
                      );
                      notifier.searchRepositoryOverview('aaa');
                    },
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[index].name),
                            ],
                          ),
                          subtitle: Text(data[index].owner.login),
                          onTap: () {},
                        );
                      },
                    ),
                  ),
                  loading: () => const Center(child:CircularProgressIndicator()),
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
