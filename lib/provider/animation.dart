import 'package:flutter/cupertino.dart';

class AnimationProvider extends ChangeNotifier {
  double _horizontal = 0;

  double get horizontal => _horizontal;

  Future<void> setSize({required double horizontal}) async {
    _horizontal = horizontal;
    notifyListeners();
  }
}
