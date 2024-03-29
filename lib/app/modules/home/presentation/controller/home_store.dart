import 'package:flutter/material.dart';
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
  final searchController = TextEditingController();

  final categories = ['Teology', 'Art', 'Buy now', 'Overall'];
  List<PostEntity> listPosts = <PostEntity>[];
  int currentPage = 0;
  bool hasMore = true;

  @observable
  String currentCategory = 'Teology';
  @observable
  bool isLoadingHomePage = false;
  @observable
  bool hasError = false;
  @observable
  bool isLoadingNextPage = false;

  String get currentSearch => searchController.text;

  @action
  Future<void> setCategory(String category) async {
    if (category == currentCategory) return;
    currentCategory = category;
    await getInitialPosts();
  }

  @action
  Future<void> _getPosts() async {
    hasError = false;
    final result = await _getPostsUsecase(
      params: GetPostsParams(
        searchText: currentSearch,
        page: currentPage,
      ),
    );
    result.fold(
      (error) {
        hasError = true;
      },
      (resultPosts) {
        if (resultPosts.length < 3) hasMore = false;
        listPosts.addAll(resultPosts);
      },
    );
  }

  clearTextSearch() => searchController.clear();

  Future<void> getInitialPosts() async {
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
