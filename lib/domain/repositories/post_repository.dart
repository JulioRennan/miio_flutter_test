import 'package:either_dart/either.dart';
import 'package:miio_flutter_test/domain/entities/post_entity.dart';
import 'package:miio_flutter_test/domain/errors/failure.dart';

import '../params/get_post_params.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostEntity>>> getPosts({
    required GetPostsParams params,
  });
}
