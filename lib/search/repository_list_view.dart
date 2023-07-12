import 'package:flutter/material.dart';
import '../repository_overview/repository_overview.dart';
import 'repository_list_tile.dart';


class RepositoryListView extends StatelessWidget {
  const RepositoryListView(this.repositoryList, {super.key});
  final List<RepositoryOverview> repositoryList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: repositoryList.length,
      itemBuilder: (context, index) {
        return RepositoryListTile(repositoryList[index]);
      },
    );
  }
}
