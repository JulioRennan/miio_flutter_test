import 'package:get_it/get_it.dart' show GetIt;

import '../../core/adapters/network_adapter/network_adapter.dart';
import '../../data/datasources/post_datasource.dart';
import '../../data/repositories/post_repository_impl.dart';
import '../../domain/repositories/post_repository.dart';
import '../../domain/usecases/get_posts_usecase.dart';
import 'home/presentation/controller/home_store.dart';

GetIt getIt = GetIt.instance;

class AppInjectionContainer {
  AppInjectionContainer() {
    getIt.registerSingleton(NetworkAdapter());

    getIt.registerFactory<PostDatasource>(
      () => PostDatasourceImpl(adapter: getIt()),
    );
    getIt.registerFactory<PostRepository>(
      () => PostRepositoryImpl(datasource: getIt()),
    );
    getIt.registerFactory(
      () => GetPostsUsecase(repository: getIt()),
    );
    getIt.registerFactory(
      () => HomeStore(getPostsUsecase: getIt()),
    );
  }
}
