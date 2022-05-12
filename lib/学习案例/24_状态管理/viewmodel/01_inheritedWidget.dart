import 'package:flutter/cupertino.dart';

//with是混入，如果该类已经继承其他类就不能使用extends继承，而是with混入
class HYCounterViewModel with ChangeNotifier{
  int _counter = 100;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;

    //通知所有使用过counter的监听者
    notifyListeners();
  }
}