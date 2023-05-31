// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$currentCategoryAtom =
      Atom(name: 'HomeStoreBase.currentCategory', context: context);

  @override
  String get currentCategory {
    _$currentCategoryAtom.reportRead();
    return super.currentCategory;
  }

  @override
  set currentCategory(String value) {
    _$currentCategoryAtom.reportWrite(value, super.currentCategory, () {
      super.currentCategory = value;
    });
  }

  late final _$isLoadingHomePageAtom =
      Atom(name: 'HomeStoreBase.isLoadingHomePage', context: context);

  @override
  bool get isLoadingHomePage {
    _$isLoadingHomePageAtom.reportRead();
    return super.isLoadingHomePage;
  }

  @override
  set isLoadingHomePage(bool value) {
    _$isLoadingHomePageAtom.reportWrite(value, super.isLoadingHomePage, () {
      super.isLoadingHomePage = value;
    });
  }

  late final _$hasErrorAtom =
      Atom(name: 'HomeStoreBase.hasError', context: context);

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  late final _$isLoadingNextPageAtom =
      Atom(name: 'HomeStoreBase.isLoadingNextPage', context: context);

  @override
  bool get isLoadingNextPage {
    _$isLoadingNextPageAtom.reportRead();
    return super.isLoadingNextPage;
  }

  @override
  set isLoadingNextPage(bool value) {
    _$isLoadingNextPageAtom.reportWrite(value, super.isLoadingNextPage, () {
      super.isLoadingNextPage = value;
    });
  }

  late final _$setCategoryAsyncAction =
      AsyncAction('HomeStoreBase.setCategory', context: context);

  @override
  Future<void> setCategory(String category) {
    return _$setCategoryAsyncAction.run(() => super.setCategory(category));
  }

  late final _$_getPostsAsyncAction =
      AsyncAction('HomeStoreBase._getPosts', context: context);

  @override
  Future<void> _getPosts() {
    return _$_getPostsAsyncAction.run(() => super._getPosts());
  }

  late final _$nextPageAsyncAction =
      AsyncAction('HomeStoreBase.nextPage', context: context);

  @override
  Future nextPage() {
    return _$nextPageAsyncAction.run(() => super.nextPage());
  }

  @override
  String toString() {
    return '''
currentCategory: ${currentCategory},
isLoadingHomePage: ${isLoadingHomePage},
hasError: ${hasError},
isLoadingNextPage: ${isLoadingNextPage}
    ''';
  }
}
