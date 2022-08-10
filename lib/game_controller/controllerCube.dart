// ignore_for_file: file_names
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:triqui/provider/validator.dart';

import '../main.dart';
import '../provider/provider.dart';
import 'endGame.dart';

class Cube extends StatelessWidget {
  final CustomPainter? painter;
  final int cube;
  const Cube({Key? key, this.painter, required this.cube}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TriquiProvider watch = context.watch<TriquiProvider>();
    TriquiProvider read = context.read<TriquiProvider>();
    ValidatorProvider watchValid = context.watch<ValidatorProvider>();
    ValidatorProvider readValid = context.read<ValidatorProvider>();
    return GestureDetector(
      child: SizedBox(
        width: 100,
        height: 100,
        child: CustomPaint(
          painter: painter,
        ),
      ),
      onTap: () {
        aux++;
        switch (cube) {
          case 1:
            if (validator(context, watchValid.validatorOne,
                read.setCubeOnePinted(cube1: true))) {
              break;
            } else {
              read.setPlayer(value1: watch.isPlayerOne ? false : true);
            }
            readValid.setValidatorOne(validator: movements[cube - 1]);
            break;
          case 2:
            if (validator(context, watchValid.validatorTwo,
                read.setCubeTwoPinted(cube2: true))) {
              break;
            } else {
              read.setPlayer(value1: watch.isPlayerOne ? false : true);
            }
            readValid.setValidatorTwo(validator: movements[cube - 1]);
            break;
          case 3:
            if (validator(context, watchValid.validatorThree,
                read.setCubeThreePinted(cube3: true))) {
              break;
            } else {
              read.setPlayer(value1: watch.isPlayerOne ? false : true);
            }
            readValid.setValidatorThree(validator: movements[cube - 1]);
            break;
          case 4:
            if (validator(context, watchValid.validatorFour,
                read.setCubeFourPinted(cube4: true))) {
              break;
            } else {
              read.setPlayer(value1: watch.isPlayerOne ? false : true);
            }
            readValid.setValidatorFour(validator: movements[cube - 1]);
            break;
          case 5:
            if (validator(context, watchValid.validatorFive,
                read.setCubeFivePinted(cube5: true))) {
              break;
            } else {
              read.setPlayer(value1: watch.isPlayerOne ? false : true);
            }
            readValid.setValidatorFive(validator: movements[cube - 1]);
            break;
          case 6:
            if (validator(context, watchValid.validatorSix,
                read.setCubeSixPinted(cube6: true))) {
              break;
            } else {
              read.setPlayer(value1: watch.isPlayerOne ? false : true);
            }
            readValid.setValidatorSix(validator: movements[cube - 1]);
            break;
          case 7:
            if (validator(context, watchValid.validatorSeven,
                read.setCubeSevenPinted(cube7: true))) {
              break;
            } else {
              read.setPlayer(value1: watch.isPlayerOne ? false : true);
            }
            readValid.setValidatorSeven(validator: movements[cube - 1]);
            break;
          case 8:
            if (validator(context, watchValid.validatorEight,
                read.setCubeEightPinted(cube8: true))) {
              break;
            } else {
              read.setPlayer(value1: watch.isPlayerOne ? false : true);
            }
            readValid.setValidatorEight(validator: movements[cube - 1]);
            break;
          case 9:
            if (validator(context, watchValid.validatorNine,
                read.setCubeNinePinted(cube9: true))) {
              break;
            } else {
              read.setPlayer(value1: watch.isPlayerOne ? false : true);
            }
            readValid.setValidatorNine(validator: movements[cube - 1]);
            break;
        }
        if (endGame(context, watch.isPlayerOne, 0, 1, 2) ||
            endGame(context, watch.isPlayerOne, 0, 3, 6) ||
            endGame(context, watch.isPlayerOne, 0, 4, 8) ||
            endGame(context, watch.isPlayerOne, 1, 4, 7) ||
            endGame(context, watch.isPlayerOne, 2, 5, 8) ||
            endGame(context, watch.isPlayerOne, 3, 4, 5) ||
            endGame(context, watch.isPlayerOne, 6, 7, 8) ||
            endGame(context, watch.isPlayerOne, 6, 4, 2)) {
          read.resetGame(resetGame: true);
          readValid.resetValidator(reset: true);
        }
      },
    );
  }

  bool validator(context, dynamic wv, dynamic rv) {
    if (wv != 2) {
      log("ya se pinto");
      aux--;
      return true;
    } else {
      log("No se ha pintado");
      rv;
      movements[cube - 1] = aux % 2 == 0 ? 0 : 1;
      return false;
    }
  }
}
