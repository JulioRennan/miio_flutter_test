import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miio_flutter_test/app/modules/home/presentation/controller/home_store.dart';
import 'package:miio_flutter_test/core/adapters/network_adapter/errors/network_errors.dart';
import 'package:miio_flutter_test/data/factories/post_factory.dart';
import 'package:miio_flutter_test/domain/params/get_post_params.dart';
import 'package:miio_flutter_test/domain/usecases/get_posts_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../data/mocks/search_posts_response.dart';

class MockGetPostsUsecase extends Mock implements GetPostsUsecase {}

void main() {
  late final GetPostsUsecase usecase;
  late final HomeStore controller;
  setUpAll(
    () {
      usecase = MockGetPostsUsecase();
      controller = HomeStore(getPostsUsecase: usecase);
      registerFallbackValue(GetPostsParams(page: 0, searchText: ''));
    },
  );

  group(
    "Testing change current category (setCategory)",
    () {
      test("Should be not change current category and not call getInitialPosts",
          () async {
        controller.currentCategory = 'Teology';
        await controller.setCategory('Teology');
        expect(controller.currentCategory, equals('Teology'));
        verifyNever(() => usecase(params: any(named: 'params')));
      });
      test(
          "Should be change current category and call getInitialPosts with sucess",
          () async {
        when(() => usecase(params: any(named: 'params'))).thenAnswer(
          (invocation) async => const Right([]),
        );
        await controller.setCategory('Art');
        expect(controller.currentCategory, equals('Art'));
        verify(() => usecase(params: any(named: 'params'))).called(1);
      });
    },
  );
  group("Testing pagination on search posts by text (nexPage)", () {
    test(
      "Should be have isLoadingNextPage=true before the completation of the nextPage called",
      () async {
        when(() => usecase(params: any(named: 'params'))).thenAnswer(
          (invocation) async => const Right([]),
        );
        final future = controller.nextPage();
        expect(controller.isLoadingNextPage, isTrue);
        await future;
        expect(controller.isLoadingNextPage, isFalse);
      },
    );
    test(
      "Should be have the currentPage equals 1 and listPosts not empty",
      () async {
        when(() => usecase(params: any(named: 'params'))).thenAnswer(
          (invocation) async => Right(
            List.from(searchPostsJSON)
                .map((e) => PostFactory.fromMap(e))
                .toList()
                .sublist(0, 2),
          ),
        );
        controller.currentPage = 0;
        await controller.nextPage();
        expect(controller.listPosts.length, 2);
        expect(controller.currentPage, 1);
      },
    );
    test(
      "Should be have the hasMore with false when, nexpage return an empty result",
      () async {
        when(() => usecase(params: any(named: 'params'))).thenAnswer(
          (invocation) async => const Right([]),
        );
        controller.currentPage = 0;
        await controller.nextPage();
        expect(controller.hasMore, isFalse);
        expect(controller.currentPage, 1);
      },
    );

    test(
      "Should be have the hasError with true when the return was a NetworkError",
      () async {
        when(() => usecase(params: any(named: 'params')))
            .thenAnswer((_) async => Left(NetworkNoConnectionError()));
        await controller.nextPage();
        expect(controller.hasError, isTrue);
      },
    );
    test(
      "Should be have the hasError with true when the return was a NetworkError",
      () async {
        when(() => usecase(params: any(named: 'params')))
            .thenAnswer((_) async => Left(NetworkNoConnectionError()));
        await controller.nextPage();
        expect(controller.hasError, isTrue);
      },
    );
  });

  group(
    "Testing search posts by text (getInitialPosts)",
    () {
      test(
        "Should be have isLoadingHomePage=true before the completation of the getInitialPosts called",
        () async {
          when(() => usecase(params: any(named: 'params'))).thenAnswer(
            (invocation) async => const Right([]),
          );
          final future = controller.getInitialPosts();
          expect(controller.isLoadingHomePage, isTrue);
          await future;
          expect(controller.isLoadingHomePage, isFalse);
        },
      );
      test(
        "Should be have the hasMore with false when, nexpage return an empty result",
        () async {
          when(() => usecase(params: any(named: 'params'))).thenAnswer(
            (invocation) async => const Right([]),
          );
          await controller.getInitialPosts();
          expect(controller.listPosts.isEmpty, isTrue);
          expect(controller.hasMore, isFalse);
        },
      );
      test(
        "Should be return a list of posts with success",
        () async {
          when(() => usecase(params: any(named: 'params'))).thenAnswer(
            (invocation) async => Right(
              List.from(searchPostsJSON)
                  .map((e) => PostFactory.fromMap(e))
                  .toList(),
            ),
          );
          await controller.getInitialPosts();
          expect(controller.listPosts.length, 5);
        },
      );
      test(
        "Should be have the hasError with true when the return was a NetworkError",
        () async {
          when(() => usecase(params: any(named: 'params')))
              .thenAnswer((_) async => Left(NetworkNoConnectionError()));
          await controller.getInitialPosts();
          expect(controller.hasError, isTrue);
        },
      );
    },
  );
}
