import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miio_flutter_test/core/adapters/network_adapter/errors/network_errors.dart';
import 'package:miio_flutter_test/data/factories/post_factory.dart';
import 'package:miio_flutter_test/domain/entities/post_entity.dart';
import 'package:miio_flutter_test/domain/errors/failure.dart';
import 'package:miio_flutter_test/domain/params/get_post_params.dart';
import 'package:miio_flutter_test/domain/repositories/post_repository.dart';
import 'package:miio_flutter_test/domain/usecases/get_posts_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../data/mocks/search_posts_response.dart';

class MockPostRepository extends Mock implements PostRepository {}

void main() {
  late final PostRepository repository;
  late final GetPostsUsecase usecase;
  setUpAll(
    () {
      repository = MockPostRepository();
      usecase = GetPostsUsecase(repository: repository);
      registerFallbackValue(GetPostsParams(page: 0, searchText: ''));
    },
  );
  group(
    "Testing search posts by text (getPosts)",
    () {
      test(
        "Should be return a list of posts with success",
        () async {
          when(() => repository.getPosts(params: any(named: 'params')))
              .thenAnswer(
            (invocation) async => Right(
              List.from(searchPostsJSON)
                  .map((e) => PostFactory.fromMap(e))
                  .toList(),
            ),
          );
          final result = await usecase(
            params: GetPostsParams(searchText: "", page: 0),
          );
          expect(result, isA<Right<Failure, List<PostEntity>>>());
          expect(result.right.length, 5);
        },
      );
      test(
        "Should be return a NetworkNoConnectionError",
        () async {
          when(() => repository.getPosts(params: any(named: 'params')))
              .thenAnswer((_) async => Left(NetworkNoConnectionError()));
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
          when(() => repository.getPosts(params: any(named: 'params')))
              .thenAnswer((_) async => Left(NetworkInternalServerError()));
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
          when(() => repository.getPosts(params: any(named: 'params')))
              .thenAnswer((_) async => Left(NetworkNotAvaiable()));
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
          when(() => repository.getPosts(params: any(named: 'params')))
              .thenAnswer((_) async =>
                  Left(NetworkResponseError(data: {}, statusCode: 400)));

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
