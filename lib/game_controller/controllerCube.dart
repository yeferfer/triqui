// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

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
    return GestureDetector(
      child: SizedBox(
        width: 100,
        height: 100,
        child: CustomPaint(
          painter: painter,
        ),
      ),
      onTap: () {
        read.setPlayer(value1: watch.isPlayerOne ? false : true);
        aux++;
        switch (cube) {
          case 1:
            read.setCubeOnePinted(cube1: true);
            break;
          case 2:
            read.setCubeTwoPinted(cube2: true);
            break;
          case 3:
            read.setCubeThreePinted(cube3: true);
            break;
          case 4:
            read.setCubeFourPinted(cube4: true);
            break;
          case 5:
            read.setCubeFivePinted(cube5: true);
            break;
          case 6:
            read.setCubeSixPinted(cube6: true);
            break;
          case 7:
            read.setCubeSevenPinted(cube7: true);
            break;
          case 8:
            read.setCubeEightPinted(cube8: true);
            break;
          case 9:
            read.setCubeNinePinted(cube9: true);
            break;
        }
        movements[cube - 1] = aux % 2 == 0 ? 0 : 1;

        endGame(context, watch.isPlayerOne, 0, 1, 2)
            ? read.resetGame(resetGame: true)
            : null;
        endGame(context, watch.isPlayerOne, 0, 3, 6)
            ? read.resetGame(resetGame: true)
            : null;
        endGame(context, watch.isPlayerOne, 0, 4, 8)
            ? read.resetGame(resetGame: true)
            : null;
        endGame(context, watch.isPlayerOne, 1, 4, 7)
            ? read.resetGame(resetGame: true)
            : null;
        endGame(context, watch.isPlayerOne, 2, 5, 8)
            ? read.resetGame(resetGame: true)
            : null;
        endGame(context, watch.isPlayerOne, 3, 4, 5)
            ? read.resetGame(resetGame: true)
            : null;
        endGame(context, watch.isPlayerOne, 6, 7, 8)
            ? read.resetGame(resetGame: true)
            : null;
        endGame(context, watch.isPlayerOne, 6, 4, 2)
            ? read.resetGame(resetGame: true)
            : null;
      },
    );
  }
}