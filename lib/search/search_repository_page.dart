import 'package:flutter/material.dart';

import 'repository_list_view.dart';
import 'search_repository_query_form.dart';

class SearchRepositoryPage extends StatelessWidget {
  const SearchRepositoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanded Column Sample'),
      ),
      body: const Center(
        child: Column(
          children: <Widget>[
            SearchRepositoryQueryForm(),
            RepositoryListView(),
          ],
        ),
      ),
    );
  }
}
