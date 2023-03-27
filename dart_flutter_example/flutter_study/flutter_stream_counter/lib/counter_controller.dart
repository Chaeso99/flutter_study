// lib/counter_controller.dart

import 'dart:async';

class CounterController {
  final _counterStreamController = StreamController<int>();

  Stream<int> get counterStream => _counterStreamController.stream; //getter - 데이터가 나오는곳

  void addCount(int newCount){
    _counterStreamController.sink.add(newCount);
  }
}