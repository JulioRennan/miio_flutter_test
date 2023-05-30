import 'package:either_dart/either.dart';
import 'package:miio_flutter_test/domain/entities/post_entity.dart';

import '../params/get_post_params.dart';

abstract class PostRepository {
  Future<Either<Error, List<PostEntity>>> getPosts({
    required GetPostsParams params,
  });
}
