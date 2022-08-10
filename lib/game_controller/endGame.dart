// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:triqui/provider/validator.dart';

import '../main.dart';
import '../pages/tied_page.dart';
import '../pages/win_page.dart';

bool endGame(context, bool win, [index1, index2, index3]) {
  if ((movements[index1] == 0 &&
      movements[index2] == 0 &&
      movements[index3] == 0) ||
      (movements[index1] == 1 &&
          movements[index2] == 1 &&
          movements[index3] == 1)) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WinPage(win: win)),
    );
    movements = [2, 2, 2, 2, 2, 2, 2, 2, 2];
    aux = 0;
    return true;
  } else if (aux > 8) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const TiePage()),
    );
    movements = [2, 2, 2, 2, 2, 2, 2, 2, 2];
    aux = 0;
    return true;
  } else {
    return false;
  }
}
