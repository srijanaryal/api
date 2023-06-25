import 'package:flutter_learning/project/post/request/post_request.dart';

class PostsRepository {
  factory PostsRepository() {
    return _instance;
  }

  PostsRepository._internal();

  static final PostsRepository _instance = PostsRepository._internal();

  Future<PostResponse> getPosts() async {
    final request = PostRequest();
    final response = await request.execute();
    return response;
  }
}
