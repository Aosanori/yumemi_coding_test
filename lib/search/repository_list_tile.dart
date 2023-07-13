import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      title: Text(
        repositoryOverview.name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        '${repositoryOverview.owner.login} ★${repositoryOverview.stargazers_count}',
      ),
      // TileCard展開後のWidget
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FaIcon(FontAwesomeIcons.code),
                      Text(
                        repositoryOverview.language ?? '---',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FaIcon(FontAwesomeIcons.codeFork),
                      Text(repositoryOverview.forks_count.toString()),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FaIcon(FontAwesomeIcons.eye),
                      Text(repositoryOverview.watchers.toString()),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FaIcon(FontAwesomeIcons.circleDot),
                      Text(repositoryOverview.open_issues.toString()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Text(
            repositoryOverview.description ?? '---',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
