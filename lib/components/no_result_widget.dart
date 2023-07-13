import 'package:flutter/material.dart';

// 検索結果がない時に表示するWidget

/// ChatGPT
/// クエリ：　Flutterで検索結果はありませんでしたを表示するアイコンを教えてください。もしなければ、それを表す画面を表示するコードを提示してください。

class NoResultsWidget extends StatelessWidget {
  const NoResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: Colors.grey,
          ),
          Text(
            'No results found.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
