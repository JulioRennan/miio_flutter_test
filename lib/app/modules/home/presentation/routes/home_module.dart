import 'package:flutter_modular/flutter_modular.dart';
import 'package:miio_flutter_test/core/adapters/network_adapter/network_adapter.dart';
import 'package:miio_flutter_test/app/data/datasources/post_datasource.dart';
import 'package:miio_flutter_test/app/data/repositories/post_repository_impl.dart';
import 'package:miio_flutter_test/app/domain/repositories/post_repositorie.dart';
import 'package:miio_flutter_test/app/domain/usecases/get_posts_usecase.dart';
import '../controller/home_store.dart';

import '../pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.instance(NetworkAdapter),
    Bind.factory<PostDatasource>(
      (i) => PostDatasourceImpl(adapter: i()),
    ),
    Bind.factory<PostRepository>(
      (i) => PostRepositoryImpl(datasource: i()),
    ),
    Bind.factory(
      (i) => GetPostsUsecase(repository: i()),
    ),
    Bind.factory(
      (i) => HomeStore(getPostsUsecase: i()),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const HomePage(),
    ),
  ];
}
