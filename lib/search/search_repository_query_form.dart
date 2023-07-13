import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'search_repository_state_notifier.dart';

// repositoryの検索フォームとボタンを生成するWidget
class SearchRepositoryQueryForm extends ConsumerWidget {
  SearchRepositoryQueryForm({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(
      searchRepositoryStateNotifierProvider.notifier,
    );
    return Form(
      key: _formKey,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 10,
                bottom: 15,
              ),
              child: TextFormField(
                enabled: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (repositoryQuery) {
                  notifier.searchRepositoryOverviewOnSubmit(repositoryQuery!);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
                }
              },
              child: const Text('Search'),
            ),
          ),
        ],
      ),
    );
  }
}
