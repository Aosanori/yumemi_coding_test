// ignore_for_file: public_member_api_docs

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
