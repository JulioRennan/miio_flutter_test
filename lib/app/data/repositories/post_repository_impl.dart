import 'package:either_dart/src/either.dart';
import 'package:miio_flutter_test/app/data/datasources/post_datasource.dart';
import 'package:miio_flutter_test/app/data/factories/post_factory.dart';
import 'package:miio_flutter_test/app/domain/entities/post_entity.dart';
import 'package:miio_flutter_test/app/domain/repositories/post_repositorie.dart';

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl({required PostDatasource datasource})
      : _datasource = datasource;
  final PostDatasource _datasource;
  @override
  Future<Either<Error, List<PostEntity>>> getPosts() async {
    final result = List.from(await _datasource.getPosts());
    final postEntities = result.map((e) => PostFactory.fromMap(e)).toList();
    return Right(postEntities);
  }
}
