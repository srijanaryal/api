// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  late final _$isUsersLoadingAtom =
      Atom(name: '_UserStore.isUsersLoading', context: context);

  @override
  bool get isUsersLoading {
    _$isUsersLoadingAtom.reportRead();
    return super.isUsersLoading;
  }

  @override
  set isUsersLoading(bool value) {
    _$isUsersLoadingAtom.reportWrite(value, super.isUsersLoading, () {
      super.isUsersLoading = value;
    });
  }

  late final _$userResponseAtom =
      Atom(name: '_UserStore.userResponse', context: context);

  @override
  UsersResponse? get userResponse {
    _$userResponseAtom.reportRead();
    return super.userResponse;
  }

  @override
  set userResponse(UsersResponse? value) {
    _$userResponseAtom.reportWrite(value, super.userResponse, () {
      super.userResponse = value;
    });
  }

  late final _$usersListAtom =
      Atom(name: '_UserStore.usersList', context: context);

  @override
  ObservableList<UsersContainer> get usersList {
    _$usersListAtom.reportRead();
    return super.usersList;
  }

  @override
  set usersList(ObservableList<UsersContainer> value) {
    _$usersListAtom.reportWrite(value, super.usersList, () {
      super.usersList = value;
    });
  }

  late final _$getUsersAsyncAction =
      AsyncAction('_UserStore.getUsers', context: context);

  @override
  Future<void> getUsers({bool showLoading = true}) {
    return _$getUsersAsyncAction
        .run(() => super.getUsers(showLoading: showLoading));
  }

  @override
  String toString() {
    return '''
isUsersLoading: ${isUsersLoading},
userResponse: ${userResponse},
usersList: ${usersList}
    ''';
  }
}
