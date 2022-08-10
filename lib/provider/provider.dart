import 'package:flutter/cupertino.dart';

class TriquiProvider extends ChangeNotifier {
  bool _isPlayerOne = true;
  bool _isCubeOnePinted = false;
  bool _isCubeTwoPinted = false;
  bool _isCubeThreePinted = false;
  bool _isCubeFourPinted = false;
  bool _isCubeFivePinted = false;
  bool _isCubeSixPinted = false;
  bool _isCubeSevenPinted = false;
  bool _isCubeEightPinted = false;
  bool _isCubeNinePinted = false;
  bool _isResetGame = false;


  bool get isPlayerOne => _isPlayerOne;

  bool get isCubeOnePinted => _isCubeOnePinted;

  bool get isCubeTwoPinted => _isCubeTwoPinted;

  bool get isCubeThreePinted => _isCubeThreePinted;

  bool get isCubeFourPinted => _isCubeFourPinted;

  bool get isCubeFivePinted => _isCubeFivePinted;

  bool get isCubeSixPinted => _isCubeSixPinted;

  bool get isCubeSevenPinted => _isCubeSevenPinted;

  bool get isCubeEightPinted => _isCubeEightPinted;

  bool get isCubeNinePinted => _isCubeNinePinted;

  bool get isResetGame => _isResetGame;

  Future<void> setPlayer({value1}) async {
    _isPlayerOne = value1;
    notifyListeners();
  }

  Future<void> setCubeOnePinted({cube1}) async {
    _isCubeOnePinted = cube1;
    notifyListeners();
  }

  Future<void> setCubeTwoPinted({cube2}) async {
    _isCubeTwoPinted = cube2;
    notifyListeners();
  }

  Future<void> setCubeThreePinted({cube3}) async {
    _isCubeThreePinted = cube3;
    notifyListeners();
  }

  Future<void> setCubeFourPinted({cube4}) async {
    _isCubeFourPinted = cube4;
    notifyListeners();
  }

  Future<void> setCubeFivePinted({cube5}) async {
    _isCubeFivePinted = cube5;
    notifyListeners();
  }

  Future<void> setCubeSixPinted({cube6}) async {
    _isCubeSixPinted = cube6;
    notifyListeners();
  }

  Future<void> setCubeSevenPinted({cube7}) async {
    _isCubeSevenPinted = cube7;
    notifyListeners();
  }

  Future<void> setCubeEightPinted({cube8}) async {
    _isCubeEightPinted = cube8;
    notifyListeners();
  }

  Future<void> setCubeNinePinted({cube9}) async {
    _isCubeNinePinted = cube9;
    notifyListeners();
  }

  Future<void> resetGame({resetGame}) async {
    _isResetGame = resetGame;
    if (_isResetGame) {
      _isPlayerOne = true;
      _isCubeOnePinted = false;
      _isCubeTwoPinted = false;
      _isCubeThreePinted = false;
      _isCubeFourPinted = false;
      _isCubeFivePinted = false;
      _isCubeSixPinted = false;
      _isCubeSevenPinted = false;
      _isCubeEightPinted = false;
      _isCubeNinePinted = false;
      _isResetGame = false;
    }
    notifyListeners();
  }
}
