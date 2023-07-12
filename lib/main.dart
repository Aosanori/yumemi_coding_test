import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'search/search_repository_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: GitHubRepositorySearchApp(),
    ),
  );
}

class GitHubRepositorySearchApp extends StatelessWidget {
  const GitHubRepositorySearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const SearchRepositoryPage(),
    );
  }
}
