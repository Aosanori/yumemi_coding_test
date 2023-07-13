// ignore_for_file: parameter_assignments

// 一回の通信で取得するデータの数
const numOfDataOnceFetching = 15;

// クエリからURLを生成する関数
String generateURLFromSearchQuery(
  String repositoryQuery,
  int page,
  int itemsPerPage,
) {
  // 空白をクエリ用に+に変換する処理
  if (repositoryQuery.substring(0, 0).isEmpty) {
    final query = repositoryQuery.replaceFirst(' ', '');
    repositoryQuery = query;
  }
  if (repositoryQuery.contains(' ')) {
    final query = repositoryQuery.replaceAll(' ', '+');
    repositoryQuery = query;
  }
  return 'https://api.github.com/search/repositories?q=$repositoryQuery&page=$page&per_page=$itemsPerPage';
}
