import 'package:either_dart/src/either.dart';
import 'package:miio_flutter_test/core/adapters/network_adapter/errors/network_errors.dart';
import 'package:miio_flutter_test/data/datasources/post_datasource.dart';
import 'package:miio_flutter_test/data/factories/post_factory.dart';
import 'package:miio_flutter_test/domain/entities/post_entity.dart';
import 'package:miio_flutter_test/domain/errors/failure.dart';
import 'package:miio_flutter_test/domain/params/get_post_params.dart';
import 'package:miio_flutter_test/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl({required PostDatasource datasource})
      : _datasource = datasource;
  final PostDatasource _datasource;
  @override
  Future<Either<Failure, List<PostEntity>>> getPosts({
    required GetPostsParams params,
  }) async {
    try {
      final result = List.from(
        await _datasource.getPosts(params: params),
      );
      final postEntities = result.map((e) => PostFactory.fromMap(e)).toList();
      return Right(postEntities);
    } on NetworkError catch (e) {
      return Left(e);
    }
  }
}
