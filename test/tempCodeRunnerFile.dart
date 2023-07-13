    // when(
    //   mockHttpClient.get(
    //     Uri.parse(
    //       'https://api.github.com/search/repositories?q=test&page=2&per_page=15',
    //     ),
    //   ),
    // ).thenAnswer(
    //   (_) async => http.Response(
    //     latin1.decode(
    //       utf8.encode(
    //         json.encode(mockResponse_2),
    //       ),
    //     ),
    //     200,
    //   ),
    // );