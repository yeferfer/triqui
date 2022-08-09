import 'package:flutter/cupertino.dart';

class CountProvider extends ChangeNotifier{
  int _xWin = 0;
  int _oWin = 0;

  int get xWin => _xWin;
  int get oWin => _oWin;

  Future<void> setXWin({required int win}) async{
    _xWin = win;
    notifyListeners();
  }

  Future<void> setOWin({required int win}) async{
    _oWin = win;
    notifyListeners();
  }
}