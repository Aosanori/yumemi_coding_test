import 'dart:convert';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:yumemi_coding_test/api/api_client.dart';
import 'package:yumemi_coding_test/components/no_result_widget.dart';
import 'package:yumemi_coding_test/main.dart';

import 'mock_data.dart';
import 'mock_http_client.mocks.dart';

void main() {
  late MockClient mockHttpClient;
  late APIClient mockAPIClient;

  setUp(() {
    mockHttpClient = MockClient();
    mockAPIClient = APIClient(mockHttpClient);
  });

  testWidgets('TextFieldが空の時にバリデーションがかかるか', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: GitHubRepositorySearchApp(),
      ),
    );

    await tester.tap(find.text('Search'));
    await tester.pump();

    expect(find.text('Please enter some text'), findsOneWidget);
  });

  testWidgets('検索ボタンを押したら検索結果が表示されるのか', (tester) async {
    when(
      mockHttpClient.get(
        Uri.parse(
          'https://api.github.com/search/repositories?q=test&page=1&per_page=15',
        ),
      ),
    ).thenAnswer(
      (_) async => http.Response(
        // https://stackoverflow.com/questions/52990816/dart-json-encodedata-can-not-accept-other-language/52993623#52993623
        latin1.decode(
          utf8.encode(
            json.encode(mockResponse_1),
          ),
        ),
        200,
      ),
    );
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
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [apiClientProvider.overrideWith((ref) => mockAPIClient)],
          child: const GitHubRepositorySearchApp(),
        ),
      );
      await tester.enterText(find.byType(TextFormField), 'test');
      await tester.tap(find.text('Search'));
      await tester.pump();
      expect(find.byType(ExpansionTileCard), findsWidgets);
    });
  });


  testWidgets('検索結果がない時NoResultsWidgetが表示されるか', (tester) async {
    when(
      mockHttpClient.get(
        Uri.parse(
          'https://api.github.com/search/repositories?q=tesyureeuuyeruyeruyreuyert&page=1&per_page=15',
        ),
      ),
    ).thenAnswer(
      (_) async => http.Response(
        // https://stackoverflow.com/questions/52990816/dart-json-encodedata-can-not-accept-other-language/52993623#52993623
        latin1.decode(
          utf8.encode(
            json.encode(mockResponseNoItems),
          ),
        ),
        200,
      ),
    );
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [apiClientProvider.overrideWith((ref) => mockAPIClient)],
          child: const GitHubRepositorySearchApp(),
        ),
      );
      await tester.enterText(find.byType(TextFormField), 'tesyureeuuyeruyeruyreuyert');
      await tester.tap(find.text('Search'));
      await tester.pump();
      expect(find.byType(NoResultsWidget), findsWidgets);
    });
  });
}
