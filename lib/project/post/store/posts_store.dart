import 'package:mobx/mobx.dart';

import '../entity/post_container.dart';
import '../post_repository.dart';
import '../request/post_request.dart';

part 'posts_store.g.dart';

class PostsStore = _PostsStore with _$PostsStore;

abstract class _PostsStore with Store {
  final _repository = PostsRepository();

  @observable
  bool isPostsLoading = false;

  @observable
  PostResponse? postResponse;

  @observable
  ObservableList<PostContainer> postlist = ObservableList<PostContainer>();

  @action
  Future<void> getPostsData({bool showLoading = true}) async {
    isPostsLoading = showLoading;

    try {
      final response = await _repository.getPosts();

      if (!response.hasError && response.postContainer != null) {
        postlist = ObservableList<PostContainer>.of(response.postContainer!);
      } else {
        // Handle error case
        print('Error fetching posts: ${response.errorMessage}');
      }
    } catch (error) {
      // Handle error case
      print('Error fetching posts: $error');
    } finally {
      isPostsLoading = false;
    }
  }
}
