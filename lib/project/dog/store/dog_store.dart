import 'package:flutter_learning/project/dog/dog_repository.dart';
import 'package:flutter_learning/project/dog/entity/dog_container.dart';
import 'package:mobx/mobx.dart';

part 'dog_store.g.dart';

class DogStore = _DogStore with _$DogStore;

abstract class _DogStore with Store {
  final _repository = DogRepository();

  @observable
  bool isDogLoading = false;

  @observable
  DogContainer? dogContainer;
  @action
  Future<void> getWork({bool showLoading = true}) async {
    isDogLoading = showLoading;
    try {
      var dogResponse = await _repository.getDog();

      if (!dogResponse.hasError) {
        dogContainer = dogResponse.dogContainer;
      } else {
        // handle error
        print('Error getting work: ${dogResponse.errorMessage}');
      }
    } catch (e) {
      // handle exception
      print('Exception getting work: $e');
    } finally {
      isDogLoading = false;
    }
  }
}
