// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostsStore on _PostsStore, Store {
  late final _$isPostsLoadingAtom =
      Atom(name: '_PostsStore.isPostsLoading', context: context);

  @override
  bool get isPostsLoading {
    _$isPostsLoadingAtom.reportRead();
    return super.isPostsLoading;
  }

  @override
  set isPostsLoading(bool value) {
    _$isPostsLoadingAtom.reportWrite(value, super.isPostsLoading, () {
      super.isPostsLoading = value;
    });
  }

  late final _$postResponseAtom =
      Atom(name: '_PostsStore.postResponse', context: context);

  @override
  PostResponse? get postResponse {
    _$postResponseAtom.reportRead();
    return super.postResponse;
  }

  @override
  set postResponse(PostResponse? value) {
    _$postResponseAtom.reportWrite(value, super.postResponse, () {
      super.postResponse = value;
    });
  }

  late final _$postlistAtom =
      Atom(name: '_PostsStore.postlist', context: context);

  @override
  ObservableList<PostContainer> get postlist {
    _$postlistAtom.reportRead();
    return super.postlist;
  }

  @override
  set postlist(ObservableList<PostContainer> value) {
    _$postlistAtom.reportWrite(value, super.postlist, () {
      super.postlist = value;
    });
  }

  late final _$getPostsDataAsyncAction =
      AsyncAction('_PostsStore.getPostsData', context: context);

  @override
  Future<void> getPostsData({bool showLoading = true}) {
    return _$getPostsDataAsyncAction
        .run(() => super.getPostsData(showLoading: showLoading));
  }

  @override
  String toString() {
    return '''
isPostsLoading: ${isPostsLoading},
postResponse: ${postResponse},
postlist: ${postlist}
    ''';
  }
}
