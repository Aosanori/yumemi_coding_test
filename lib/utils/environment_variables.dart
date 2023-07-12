// ignore_for_file: public_member_api_docs

String generateURLFromSearchQuery(String repositoryQuery, int page, int itemsPerPage) =>
    'https://api.github.com/search/repositories?q=$repositoryQuery&page=$page&per_page=$itemsPerPage';
