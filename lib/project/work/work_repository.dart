import 'package:flutter_learning/project/work/request/work_request.dart';

class WorkRespository {
  factory WorkRespository() {
    return _instance;
  }

  WorkRespository._internal();

  static final WorkRespository _instance = WorkRespository._internal();

  Future<DogResponse> getWork() async {
    final request = WorkRequest();
    final response = await request.execute();
    return response;
  }
}
