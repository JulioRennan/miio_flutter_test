import 'package:flutter_test/flutter_test.dart';
import 'package:miio_flutter_test/core/adapters/network_adapter/errors/network_errors.dart';
import 'package:miio_flutter_test/core/adapters/network_adapter/network_adapter.dart';
import 'package:miio_flutter_test/data/datasources/post_datasource.dart';
import 'package:miio_flutter_test/domain/params/get_post_params.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/search_posts_response.dart';

class MockNetworkAdapter extends Mock implements NetworkAdapter {}

void main() {
  late final NetworkAdapter adapter;
  late final PostDatasource datasource;
  setUpAll(
    () {
      adapter = MockNetworkAdapter();
      datasource = PostDatasourceImpl(adapter: adapter);
    },
  );
  group(
    "Testing search posts by text (getPosts)",
    () {
      test(
        "Should be return a list of posts with success",
        () async {
          when(
            () => adapter.get(any(), query: any(named: "query")),
          ).thenAnswer(
            (invocation) async => searchPostsJSON,
          );
          final result = await datasource.getPosts(
            params: GetPostsParams(searchText: "", page: 0),
          );
          expect(result, equals(searchPostsJSON));
        },
      );
      test(
        "Should be return a NetworkNoConnectionError",
        () async {
          when(
            () => adapter.get(any(), query: any(named: "query")),
          ).thenAnswer((_) async => throw NetworkNoConnectionError());
          final future = datasource.getPosts(
            params: GetPostsParams(searchText: "", page: 0),
          );
          await expectLater(
            future,
            throwsA(isA<NetworkNoConnectionError>()),
          );
        },
      );
      test(
        "Should be return a NetworkInternalServerError",
        () async {
          when(
            () => adapter.get(any(), query: any(named: "query")),
          ).thenAnswer((_) async => throw NetworkInternalServerError());
          final future = datasource.getPosts(
            params: GetPostsParams(searchText: "", page: 0),
          );
          await expectLater(
            future,
            throwsA(isA<NetworkInternalServerError>()),
          );
        },
      );
      test(
        "Should be return a NetworkNotAvaiable",
        () async {
          when(
            () => adapter.get(any(), query: any(named: "query")),
          ).thenAnswer((_) async => throw NetworkNotAvaiable());
          final future = datasource.getPosts(
            params: GetPostsParams(searchText: "", page: 0),
          );
          await expectLater(
            future,
            throwsA(isA<NetworkNotAvaiable>()),
          );
        },
      );
      test(
        "Should be return a NetworkResponseError",
        () async {
          when(
            () => adapter.get(any(), query: any(named: "query")),
          ).thenAnswer(
            (_) async => throw NetworkResponseError(
              data: {},
              statusCode: 400,
            ),
          );
          final future = datasource.getPosts(
            params: GetPostsParams(searchText: "", page: 0),
          );
          await expectLater(
            future,
            throwsA(isA<NetworkResponseError>()),
          );
        },
      );
    },
  );
}
