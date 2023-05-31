import 'package:either_dart/either.dart';
import 'package:miio_flutter_test/domain/errors/failure.dart';
import 'package:miio_flutter_test/domain/repositories/post_repository.dart';

import '../entities/post_entity.dart';
import '../params/get_post_params.dart';

class GetPostsUsecase {
  final PostRepository _repository;

  const GetPostsUsecase({
    required PostRepository repository,
  }) : _repository = repository;

  Future<Either<Failure, List<PostEntity>>> call({
    required GetPostsParams params,
  }) =>
      _repository.getPosts(params: params);
}
