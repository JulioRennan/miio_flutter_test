import 'package:miio_flutter_test/core/adapters/network_adapter/network_adapter.dart';

abstract class PostDatasource {
  Future<dynamic> getPosts();
}

class PostDatasourceImpl implements PostDatasource {
  final NetworkAdapter _adapter;
  const PostDatasourceImpl({
    required NetworkAdapter adapter,
  }) : _adapter = adapter;

  @override
  Future<dynamic> getPosts() => _adapter.get("/posts");
}
