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

  late final _$getPostsAsyncAction =
      AsyncAction('HomeStoreBase.getPosts', context: context);

  @override
  Future<void> getPosts() {
    return _$getPostsAsyncAction.run(() => super.getPosts());
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  dynamic setCategory(String category) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setCategory');
    try {
      return super.setCategory(category);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentCategory: ${currentCategory},
isLoadingHomePage: ${isLoadingHomePage}
    ''';
  }
}
