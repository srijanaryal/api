import 'package:flutter/material.dart';
import 'package:flutter_learning/shared/text_widgets/build_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../shared/widget/custom_loader.dart';
import '../store/posts_store.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);
  static const String route = '/postsScreen';

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late PostsStore postsStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    postsStore = Provider.of<PostsStore>(context, listen: false);
    _callApi();
  }

  _callApi({bool showLoading = true}) async {
    await postsStore.getPostsData(showLoading: showLoading);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      // backgroundColor: const Color(0xFF060C3F),
      body: Stack(
        children: [
          _createBody(),
          Observer(builder: (context) {
            return Visibility(
              visible: postsStore.isPostsLoading,
              child: const CustomProgressIndicatorWidget(),
            );
          }),
        ],
      ),
    );
  }

  Widget _createBody() {
    return Observer(builder: (_) {
      if (postsStore.isPostsLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (postsStore.postResponse != null &&
          postsStore.postResponse!.hasError) {
        return const Center(child: Text('Error fetching posts'));
      } else if (postsStore.postlist.isEmpty) {
        return const Center(child: Text('No posts available'));
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: ListView.builder(
            itemCount: postsStore.postlist.length,
            itemBuilder: (context, index) {
              final post = postsStore.postlist[index];
              return ListTile(
                title: BuildText(
                  text: post.title.toUpperCase(),
                  color: Colors.red,
                  weight: FontWeight.bold,
                  fontSize: 10,
                ),
                subtitle: Text(post.body),
              );
            },
          ),
        );
      }
    });
  }
}
