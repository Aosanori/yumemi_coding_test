import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository_overview/repository_overview.dart';

class RepositoryListTile extends ConsumerWidget {
  RepositoryListTile(this.repositoryOverview, {super.key});
  final RepositoryOverview repositoryOverview;
  final GlobalKey<ExpansionTileCardState> cardKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ExpansionTileCard(
      key: cardKey,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(repositoryOverview.owner.avatar_url),
      ),
      title: Text(repositoryOverview.name),
      subtitle: Text(
        '★${repositoryOverview.stargazers_count}',
      ),
      children: <Widget>[
        Text(repositoryOverview.forks_count.toString()),
        Text(repositoryOverview.open_issues.toString()),
        Text(repositoryOverview.watchers.toString()),
        Text(repositoryOverview.owner.login),
        Text(repositoryOverview.language ?? ''),
        Text(repositoryOverview.description ?? ''),
      ],
    );
  }
}
