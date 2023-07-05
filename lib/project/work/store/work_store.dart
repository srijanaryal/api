import 'package:flutter_learning/project/work/entity/work_container.dart';
import 'package:flutter_learning/project/work/request/work_request.dart';
import 'package:flutter_learning/project/work/work_repository.dart';
import 'package:mobx/mobx.dart';

part 'work_store.g.dart';

class WorkStore = _WorkStore with _$WorkStore;

abstract class _WorkStore with Store {
  final _repository = WorkRespository();

  @observable
  bool isWorkLoading = false;

  @observable
  WorkContainer? workContainer;

  @action
  Future<void> getWork({bool showLoading = true}) async {
    isWorkLoading = showLoading;
    try {
      DogResponse workResponse = await _repository.getWork();

      if (!workResponse.hasError) {
        workContainer = workResponse.workContainer;
      } else {
        // handle error
        print('Error getting work: ${workResponse.errorMessage}');
      }
    } catch (e) {
      // handle exception
      print('Exception getting work: $e');
    } finally {
      isWorkLoading = false;
    }
  }
}
