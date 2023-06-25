import 'package:flutter_learning/project/user/request/users_request.dart';

class UsersRepository {
  factory UsersRepository() {
    return _instance;
  }

  UsersRepository._internal();

  static final UsersRepository _instance = UsersRepository._internal();

  Future<UsersResponse> getUsers() async {
    final request = UsersRequest();
    final response = await request.execute();
    return response;
  }
}
