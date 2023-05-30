import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:miio_flutter_test/app/data/datasources/post_datasource.dart';
import 'package:miio_flutter_test/app/data/repositories/post_repository_impl.dart';
import 'package:miio_flutter_test/app/domain/usecases/get_posts_usecase.dart';
import 'package:miio_flutter_test/app/modules/home/presentation/controller/home_store.dart';
import 'package:miio_flutter_test/core/adapters/network_adapter/network_adapter.dart';
import 'app/domain/repositories/post_repositorie.dart';
import 'app/modules/app_widget.dart';

GetIt getIt = GetIt.instance;

void main() {
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
  return runApp(
    const AppWidget(),
  );
}
