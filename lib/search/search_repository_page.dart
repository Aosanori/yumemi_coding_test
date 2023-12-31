import 'package:flutter/material.dart';

import 'repository_list_view.dart';
import 'search_repository_query_form.dart';

class SearchRepositoryPage extends StatelessWidget {
  const SearchRepositoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Repository Search App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SearchRepositoryQueryForm(),
            const RepositoryListView(),
          ],
        ),
      ),
    );
  }
}
