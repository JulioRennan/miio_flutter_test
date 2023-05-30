import 'package:either_dart/either.dart';
import 'package:miio_flutter_test/app/domain/repositories/post_repositorie.dart';

import '../entities/post_entity.dart';

class GetPostsUsecase {
  final PostRepository _repository;

  const GetPostsUsecase({
    required PostRepository repository,
  }) : _repository = repository;

  Future<Either<Error, List<PostEntity>>> call() => _repository.getPosts();
}
