// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:triqui/game_controller/validator.dart';
import 'package:triqui/provider/validator.dart';

import '../main.dart';
import '../provider/animation.dart';
import '../provider/count.dart';
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
    AnimationProvider readAnimation = context.read<AnimationProvider>();
    CountProvider watchCounter = context.watch<CountProvider>();
    CountProvider readCounter = context.read<CountProvider>();
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
            if (validator(watchValid.validatorOne,
                read.setCubeOnePinted(cube1: true), cube)) {
              readAnimation.setSize(horizontal: 10);
              break;
            } else {
              read.setPlayer(value1: watch.isPlayerOne ? false : true);
            }
            readValid.setValidatorOne(validator: movements[cube - 1]);
            break;
          case 2:
            if (validator(watchValid.validatorTwo,
                read.setCubeTwoPinted(cube2: true), cube)) {
              readAnimation.setSize(horizontal: 10);
              break;
            } else {
              read.setPlayer(value1: watch.isPlayerOne ? false : true);
            }
            readValid.setValidatorTwo(validator: movements[cube - 1]);
            break;
          case 3:
            if (validator(watchValid.validatorThree,
                read.setCubeThreePinted(cube3: true), cube)) {
              readAnimation.setSize(horizontal: 10);
              break;
            } else {
              read.setPlayer(value1: watch.isPlayerOne ? false : true);
            }
            readValid.setValidatorThree(validator: movements[cube - 1]);
            break;
          case 4:
            if (validator(watchValid.validatorFour,
                read.setCubeFourPinted(cube4: true), cube)) {
              readAnimation.setSize(horizontal: 10);
              break;
            } else {
              read.setPlayer(value1: watch.isPlayerOne ? false : true);
            }
            readValid.setValidatorFour(validator: movements[cube - 1]);
            break;
          case 5:
            if (validator(watchValid.validatorFive,
                read.setCubeFivePinted(cube5: true), cube)) {
              readAnimation.setSize(horizontal: 10);
              break;
            } else {
              read.setPlayer(value1: watch.isPlayerOne ? false : true);
            }
            readValid.setValidatorFive(validator: movements[cube - 1]);
            break;
          case 6:
            if (validator(watchValid.validatorSix,
                read.setCubeSixPinted(cube6: true), cube)) {
              readAnimation.setSize(horizontal: 10);
              break;
            } else {
              read.setPlayer(value1: watch.isPlayerOne ? false : true);
            }
            readValid.setValidatorSix(validator: movements[cube - 1]);
            break;
          case 7:
            if (validator(watchValid.validatorSeven,
                read.setCubeSevenPinted(cube7: true), cube)) {
              readAnimation.setSize(horizontal: 10);
              break;
            } else {
              read.setPlayer(value1: watch.isPlayerOne ? false : true);
            }
            readValid.setValidatorSeven(validator: movements[cube - 1]);
            break;
          case 8:
            if (validator(watchValid.validatorEight,
                read.setCubeEightPinted(cube8: true), cube)) {
              readAnimation.setSize(horizontal: 10);
              break;
            } else {
              read.setPlayer(value1: watch.isPlayerOne ? false : true);
            }
            readValid.setValidatorEight(validator: movements[cube - 1]);
            break;
          case 9:
            if (validator(watchValid.validatorNine,
                read.setCubeNinePinted(cube9: true), cube)) {
              readAnimation.setSize(horizontal: 10);
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
          watch.isPlayerOne
              ? readCounter.setXWin(win: watchCounter.xWin + 1)
              : readCounter.setOWin(win: watchCounter.oWin + 1);
          read.resetGame(resetGame: true);
          readValid.resetValidator(reset: true);
        }
      },
    );
  }
}
