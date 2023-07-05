import 'package:flutter_learning/Auth/store/auth_store.dart';
import 'package:flutter_learning/project/dog/store/dog_store.dart';
import 'package:flutter_learning/project/user/store/user_store.dart';
import 'package:flutter_learning/project/work/store/work_store.dart';
import 'package:provider/single_child_widget.dart';

import 'package:provider/provider.dart';

import '../../project/post/store/posts_store.dart';

class Providers {
  static List<SingleChildWidget> listOfProviders = [
    Provider(
      create: (context) => AuthStore(),
    ),
    Provider(
      create: (context) => PostsStore(),
    ),
    Provider(
      create: (context) => UserStore(),
    ),
    Provider(
      create: (context) => WorkStore(),
    ),
    Provider(
      create: (context) => DogStore(),
    ),
  ];
}
