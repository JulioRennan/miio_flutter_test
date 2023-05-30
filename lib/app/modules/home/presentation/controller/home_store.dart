import 'package:miio_flutter_test/domain/entities/post_entity.dart';
import 'package:miio_flutter_test/domain/params/get_post_params.dart';
import 'package:miio_flutter_test/domain/usecases/get_posts_usecase.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  HomeStoreBase({
    required GetPostsUsecase getPostsUsecase,
  }) : _getPostsUsecase = getPostsUsecase;

  final GetPostsUsecase _getPostsUsecase;
  final categories = ['Teology', 'Art', 'Buy now', 'Overall'];

  ObservableList<PostEntity> listPosts = <PostEntity>[].asObservable();

  @observable
  String currentCategory = 'Teology';

  @observable
  bool isLoadingHomePage = false;

  @action
  setCategory(String category) {
    if (category == currentCategory) return;
    currentCategory = category;
    getInitialPosts();
  }

  String currentSearch = '';
  int currentPage = 0;
  bool hasMore = true;

  setCurrentSearch(String value) => currentSearch = value;

  @observable
  bool isLoadingNextPage = false;

  @action
  Future<void> _getPosts() async {
    final result = await _getPostsUsecase(
      params: GetPostsParams(
        searchText: currentSearch,
        page: currentPage,
      ),
    );
    result.fold(
      (left) => null,
      (resultPosts) {
        if (resultPosts.length < 3) hasMore = false;
        listPosts.addAll(resultPosts);
      },
    );
  }

  getInitialPosts() async {
    isLoadingHomePage = true;
    listPosts.clear();
    currentPage = 0;
    hasMore = true;
    await _getPosts();
    isLoadingHomePage = false;
  }

  @action
  nextPage() async {
    isLoadingNextPage = true;
    currentPage++;
    await _getPosts();
    isLoadingNextPage = false;
  }
}
