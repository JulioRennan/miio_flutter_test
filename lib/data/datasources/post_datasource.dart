import 'package:miio_flutter_test/core/adapters/network_adapter/network_adapter.dart';
import 'package:miio_flutter_test/domain/params/get_post_params.dart';

abstract class PostDatasource {
  Future<dynamic> getPosts({
    required GetPostsParams params,
  });
}

class PostDatasourceImpl implements PostDatasource {
  final NetworkAdapter _adapter;
  const PostDatasourceImpl({
    required NetworkAdapter adapter,
  }) : _adapter = adapter;

  @override
  Future<dynamic> getPosts({
    required GetPostsParams params,
  }) {
    const sizePage = 3;
    return _adapter.get(
      "/posts",
      query: {
        if (params.searchText.isNotEmpty) 'q': params.searchText,
        '_start': params.page * sizePage,
        '_end': (params.page + 1) * sizePage
      },
    );
  }
}
