import 'package:flutter_learning/project/user/entity/users_container.dart';
import 'package:flutter_learning/project/user/user_repository.dart';
import 'package:mobx/mobx.dart';

import '../request/users_request.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final _repository = UsersRepository();

  @observable
  bool isUsersLoading = false;

  @observable
  UsersResponse? userResponse;

  @observable
  ObservableList<UsersContainer> usersList = ObservableList<UsersContainer>();

  @action
  Future<void> getUsers({bool showLoading = true}) async {
    isUsersLoading = showLoading;

    try {
      final response = await _repository.getUsers();

      if (!response.hasError && response.usersContainer != null) {
        usersList = ObservableList<UsersContainer>.of(response.usersContainer!);
      } else {
        // Handle error case
        print('Error fetching posts: ${response.errorMessage}');
      }
    } catch (error) {
      // Handle error case
      print('Error fetching posts: $error');
    } finally {
      isUsersLoading = false;
    }
  }
}
