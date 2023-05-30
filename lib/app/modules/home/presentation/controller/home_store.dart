import 'package:miio_flutter_test/app/domain/entities/post_entity.dart';
import 'package:miio_flutter_test/app/domain/usecases/get_posts_usecase.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  HomeStoreBase({
    required GetPostsUsecase getPostsUsecase,
  }) : _getPostsUsecase = getPostsUsecase;

  final GetPostsUsecase _getPostsUsecase;
  final categories = ['Teology', 'Art', 'Buy now', 'Overall'];
  List<PostEntity> listPosts = [];

  @observable
  String currentCategory = 'Teology';

  @observable
  bool isLoadingHomePage = false;

  @action
  setCategory(String category) {
    if (category == currentCategory) return;
    currentCategory = category;
    getPosts();
  }

  @action
  Future<void> getPosts() async {
    isLoadingHomePage = true;
    final result = await _getPostsUsecase();
    result.fold(
      (left) => null,
      (resultPosts) => listPosts = resultPosts,
    );
    isLoadingHomePage = false;
  }
}
