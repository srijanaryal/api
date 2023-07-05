import 'package:flutter/material.dart';
import 'package:flutter_learning/project/user/store/user_store.dart';
import 'package:flutter_learning/shared/text_widgets/build_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../shared/widget/custom_loader.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);
  static const String route = '/postsScreen';

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  UserStore userStore = UserStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userStore = Provider.of<UserStore>(context, listen: false);
    _callApi();
  }

  _callApi({bool showLoading = true}) async {
    await userStore.getUsers(showLoading: showLoading);
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
              visible: userStore.isUsersLoading,
              child: const CustomProgressIndicatorWidget(),
            );
          }),
        ],
      ),
    );
  }

  Widget _createBody() {
    return Observer(builder: (_) {
      if (userStore.isUsersLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (userStore.userResponse != null &&
          userStore.userResponse!.hasError) {
        return const Center(child: Text('Error fetching posts'));
      } else if (userStore.usersList.isEmpty) {
        return const Center(child: Text('No posts available'));
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: ListView.builder(
            itemCount: userStore.usersList.length,
            itemBuilder: (context, index) {
              final post = userStore.usersList[index];
              return ListTile(
                leading: const Text('Hello'),
                title: BuildText(
                  text: post.username,
                  color: Colors.red,
                  weight: FontWeight.bold,
                  fontSize: 10,
                ),
                subtitle: Text(post.address!.city),
              );
            },
          ),
        );
      }
    });
  }
}
