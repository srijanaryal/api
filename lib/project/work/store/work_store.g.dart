// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WorkStore on _WorkStore, Store {
  late final _$isWorkLoadingAtom =
      Atom(name: '_WorkStore.isWorkLoading', context: context);

  @override
  bool get isWorkLoading {
    _$isWorkLoadingAtom.reportRead();
    return super.isWorkLoading;
  }

  @override
  set isWorkLoading(bool value) {
    _$isWorkLoadingAtom.reportWrite(value, super.isWorkLoading, () {
      super.isWorkLoading = value;
    });
  }

  late final _$workContainerAtom =
      Atom(name: '_WorkStore.workContainer', context: context);

  @override
  WorkContainer? get workContainer {
    _$workContainerAtom.reportRead();
    return super.workContainer;
  }

  @override
  set workContainer(WorkContainer? value) {
    _$workContainerAtom.reportWrite(value, super.workContainer, () {
      super.workContainer = value;
    });
  }

  late final _$getWorkAsyncAction =
      AsyncAction('_WorkStore.getWork', context: context);

  @override
  Future<void> getWork({bool showLoading = true}) {
    return _$getWorkAsyncAction
        .run(() => super.getWork(showLoading: showLoading));
  }

  @override
  String toString() {
    return '''
isWorkLoading: ${isWorkLoading},
workContainer: ${workContainer}
    ''';
  }
}
