import 'package:flutter/material.dart';

class ValidatorProvider extends ChangeNotifier {
  int _validatorOne = 2;
  int _validatorTwo = 2;
  int _validatorThree = 2;
  int _validatorFour = 2;
  int _validatorFive = 2;
  int _validatorSix = 2;
  int _validatorSeven = 2;
  int _validatorEight = 2;
  int _validatorNine = 2;
  bool _reset = false;

  int get validatorOne => _validatorOne;
  int get validatorTwo => _validatorTwo;
  int get validatorThree => _validatorThree;
  int get validatorFour => _validatorFour;
  int get validatorFive => _validatorFive;
  int get validatorSix => _validatorSix;
  int get validatorSeven => _validatorSeven;
  int get validatorEight => _validatorEight;
  int get validatorNine => _validatorNine;
  bool get reset => _reset;

  Future<void> setValidatorOne({required int validator}) async {
    _validatorOne = validator;
    notifyListeners();
  }

  Future<void> setValidatorTwo({required int validator}) async {
    _validatorTwo = validator;
    notifyListeners();
  }

  Future<void> setValidatorThree({required int validator}) async {
    _validatorThree = validator;
    notifyListeners();
  }

  Future<void> setValidatorFour({required int validator}) async {
    _validatorFour = validator;
    notifyListeners();
  }

  Future<void> setValidatorFive({required int validator}) async {
    _validatorFive = validator;
    notifyListeners();
  }

  Future<void> setValidatorSix({required int validator}) async {
    _validatorSix = validator;
    notifyListeners();
  }

  Future<void> setValidatorSeven({required int validator}) async {
    _validatorSeven = validator;
    notifyListeners();
  }

  Future<void> setValidatorEight({required int validator}) async {
    _validatorEight = validator;
    notifyListeners();
  }

  Future<void> setValidatorNine({required int validator}) async {
    _validatorNine = validator;
    notifyListeners();
  }

  Future<void> resetValidator({required bool reset}) async {
    _reset = reset;
    if (reset) {
      _validatorOne = 2;
      _validatorTwo = 2;
      _validatorThree = 2;
      _validatorFour = 2;
      _validatorFive = 2;
      _validatorSix = 2;
      _validatorSeven = 2;
      _validatorEight = 2;
      _validatorNine = 2;
    }
    notifyListeners();
  }
}
