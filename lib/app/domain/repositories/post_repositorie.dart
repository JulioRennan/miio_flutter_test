import 'package:either_dart/either.dart';
import 'package:miio_flutter_test/app/domain/entities/post_entity.dart';

abstract class PostRepository {
  Future<Either<Error, List<PostEntity>>> getPosts();
}
