// lib/counter_controller.dart

import 'package:flutter/cupertino.dart';

class CounterController with ChangeNotifier{
  int _count = 0; //언더바는 프라이빗 이라는 의미

  int get count => _count;

  void changeTo(int newCount){
    _count = newCount;

    //상태 변경 후 무조건 호출해야함
    notifyListeners();
  }
}