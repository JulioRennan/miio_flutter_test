import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miio_flutter_test/core/adapters/network_adapter/errors/network_errors.dart';
import 'package:miio_flutter_test/data/datasources/post_datasource.dart';
import 'package:miio_flutter_test/data/repositories/post_repository_impl.dart';
import 'package:miio_flutter_test/domain/entities/post_entity.dart';
import 'package:miio_flutter_test/domain/errors/failure.dart';
import 'package:miio_flutter_test/domain/params/get_post_params.dart';
import 'package:miio_flutter_test/domain/repositories/post_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/search_posts_response.dart';

class MockPostDatasource extends Mock implements PostDatasource {}

void main() {
  late final PostDatasource datasource;
  late final PostRepository repository;
  setUpAll(
    () {
      datasource = MockPostDatasource();
      repository = PostRepositoryImpl(datasource: datasource);
      registerFallbackValue(
        GetPostsParams(page: 0, searchText: ''),
      );
    },
  );
  group(
    "Testing search posts by text (getPosts)",
    () {
      test(
        "Should be return a list of posts with sucess",
        () async {
          when(() => datasource.getPosts(params: any(named: 'params')))
              .thenAnswer(
            (invocation) async => searchPostsJSON,
          );
          final result = await repository.getPosts(
            params: GetPostsParams(searchText: "", page: 0),
          );
          expect(result, isA<Right<Failure, List<PostEntity>>>());
          expect(result.right.length, 5);
        },
      );
      test(
        "Should be return a NetworkNoConnectionError",
        () async {
          when(() => datasource.getPosts(params: any(named: 'params')))
              .thenThrow(NetworkNoConnectionError());
          final result = await repository.getPosts(
            params: GetPostsParams(searchText: "", page: 0),
          );
          expect(result.isLeft, isTrue);
          expect(result.left, isA<NetworkNoConnectionError>());
        },
      );
      test(
        "Should be return a NetworkInternalServerError",
        () async {
          when(() => datasource.getPosts(params: any(named: 'params')))
              .thenThrow(NetworkInternalServerError());
          final result = await repository.getPosts(
            params: GetPostsParams(searchText: "", page: 0),
          );
          expect(result.isLeft, isTrue);
          expect(result.left, isA<NetworkInternalServerError>());
        },
      );
      test(
        "Should be return a NetworkNotAvaiable",
        () async {
          when(() => datasource.getPosts(params: any(named: 'params')))
              .thenThrow(NetworkNotAvaiable());
          final result = await repository.getPosts(
            params: GetPostsParams(searchText: "", page: 0),
          );
          expect(result.isLeft, isTrue);
          expect(result.left, isA<NetworkNotAvaiable>());
        },
      );
      test(
        "Should be return a NetworkResponseError",
        () async {
          when(() => datasource.getPosts(params: any(named: 'params')))
              .thenThrow(NetworkResponseError(data: {},statusCode: 400));
          final result = await repository.getPosts(
            params: GetPostsParams(searchText: "", page: 0),
          );
          expect(result.isLeft, isTrue);
          expect(result.left, isA<NetworkResponseError>());
        },
      );
    },
  );
}
