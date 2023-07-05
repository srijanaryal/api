// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DogStore on _DogStore, Store {
  late final _$isDogLoadingAtom =
      Atom(name: '_DogStore.isDogLoading', context: context);

  @override
  bool get isDogLoading {
    _$isDogLoadingAtom.reportRead();
    return super.isDogLoading;
  }

  @override
  set isDogLoading(bool value) {
    _$isDogLoadingAtom.reportWrite(value, super.isDogLoading, () {
      super.isDogLoading = value;
    });
  }

  late final _$dogContainerAtom =
      Atom(name: '_DogStore.dogContainer', context: context);

  @override
  DogContainer? get dogContainer {
    _$dogContainerAtom.reportRead();
    return super.dogContainer;
  }

  @override
  set dogContainer(DogContainer? value) {
    _$dogContainerAtom.reportWrite(value, super.dogContainer, () {
      super.dogContainer = value;
    });
  }

  late final _$getWorkAsyncAction =
      AsyncAction('_DogStore.getWork', context: context);

  @override
  Future<void> getWork({bool showLoading = true}) {
    return _$getWorkAsyncAction
        .run(() => super.getWork(showLoading: showLoading));
  }

  @override
  String toString() {
    return '''
isDogLoading: ${isDogLoading},
dogContainer: ${dogContainer}
    ''';
  }
}
