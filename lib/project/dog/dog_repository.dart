import 'package:flutter_learning/project/dog/request/dog_request.dart';

class DogRepository {
  factory DogRepository() {
    return _instance;
  }

  DogRepository._internal();

  static final DogRepository _instance = DogRepository._internal();

  Future<DogResponse> getDog() async {
    final request = DogRequest();
    final response = await request.execute();
    return response;
  }
}
