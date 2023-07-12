import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'search_repository_state_notifier.dart';

class SearchRepositoryQueryForm extends ConsumerWidget {
  const SearchRepositoryQueryForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(
      searchRepositoryStateNotifierProvider.notifier,
    );
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 10,
              bottom: 15,
            ),
            child: TextField(
              controller: notifier.queryTextController,
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
            onPressed: notifier.searchRepositoryOverviewOnSubmit,
            child: const Text('Search'),
          ),
        ),
      ],
    );
  }
}
