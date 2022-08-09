import 'dart:developer';

import 'package:triqui/pages/tie_page.dart';
import 'package:triqui/pages/win_page.dart';
import 'package:triqui/painted/board.dart';
import 'package:triqui/painted/o.dart';
import 'package:triqui/painted/x.dart';
import 'package:triqui/provider/provider.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<TriquiProvider>(
            create: (context) => TriquiProvider(),
          ),
        ],
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'TRIQUI',
            theme: ThemeData.light(),
            home: const TriquiPage(),
          );
        });
  }
}

List<int> movements = [2, 2, 2, 2, 2, 2, 2, 2, 2];
int aux = 0;

class TriquiPage extends StatelessWidget {
  const TriquiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TriquiProvider watch = context.watch<TriquiProvider>();
    TriquiProvider read = context.read<TriquiProvider>();
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 100, bottom: 100),
              child: Text(
                "TRIQUI",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 300,
              width: 300,
              child: Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          watch.isCubeOnePinted
                              ? movements.elementAt(0) == 0
                                  ? XContainer(painter: XPainter())
                                  : OContainer(painter: OPainter())
                              : const CustomPaint(),
                          Cube(
                              painter: BoardPainter(cube: "OneTwoSevenEight"),
                              cube: 1),
                        ],
                      ),
                      Stack(
                        children: [
                          watch.isCubeTwoPinted
                              ? movements.elementAt(1) == 0
                                  ? XContainer(painter: XPainter())
                                  : OContainer(painter: OPainter())
                              : const CustomPaint(),
                          Cube(
                              painter: BoardPainter(cube: "OneTwoSevenEight"),
                              cube: 2),
                        ],
                      ),
                      Stack(
                        children: [
                          watch.isCubeThreePinted
                              ? movements.elementAt(2) == 0
                                  ? XContainer(painter: XPainter())
                                  : OContainer(painter: OPainter())
                              : const CustomPaint(),
                          Cube(
                              painter: BoardPainter(cube: "ThreeNine"),
                              cube: 3),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Stack(
                        children: [
                          watch.isCubeFourPinted
                              ? movements.elementAt(3) == 0
                                  ? XContainer(painter: XPainter())
                                  : OContainer(painter: OPainter())
                              : const CustomPaint(),
                          Cube(painter: BoardPainter(cube: "FourSix"), cube: 4),
                        ],
                      ),
                      Stack(
                        children: [
                          watch.isCubeFivePinted
                              ? movements.elementAt(4) == 0
                                  ? XContainer(painter: XPainter())
                                  : OContainer(painter: OPainter())
                              : const CustomPaint(),
                          Cube(painter: BoardPainter(cube: "Five"), cube: 5),
                        ],
                      ),
                      Stack(
                        children: [
                          watch.isCubeSixPinted
                              ? movements.elementAt(5) == 0
                                  ? XContainer(painter: XPainter())
                                  : OContainer(painter: OPainter())
                              : const CustomPaint(),
                          Cube(painter: BoardPainter(cube: "FourSix"), cube: 6),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Stack(
                        children: [
                          watch.isCubeSevenPinted
                              ? movements.elementAt(6) == 0
                                  ? XContainer(painter: XPainter())
                                  : OContainer(painter: OPainter())
                              : const CustomPaint(),
                          Cube(
                              painter: BoardPainter(cube: "OneTwoSevenEight"),
                              cube: 7),
                        ],
                      ),
                      Stack(
                        children: [
                          watch.isCubeEightPinted
                              ? movements.elementAt(7) == 0
                                  ? XContainer(painter: XPainter())
                                  : OContainer(painter: OPainter())
                              : const CustomPaint(),
                          Cube(
                              painter: BoardPainter(cube: "OneTwoSevenEight"),
                              cube: 8),
                        ],
                      ),
                      Stack(
                        children: [
                          watch.isCubeNinePinted
                              ? movements.elementAt(8) == 0
                                  ? XContainer(painter: XPainter())
                                  : OContainer(painter: OPainter())
                              : const CustomPaint(),
                          Cube(
                              painter: BoardPainter(cube: "ThreeNine"),
                              cube: 9),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text(
                "Turno del jugador ${watch.isPlayerOne ? "1" : "2"}"
                    .toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

bool endGame(context, bool win, [index1, index2, index3]) {
  if ((movements[index1] == 0 &&
          movements[index2] == 0 &&
          movements[index3] == 0) ||
      (movements[index1] == 1 &&
          movements[index2] == 1 &&
          movements[index3] == 1)) {
    // ? log("Win")
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WinPage(win: win)),
    );
    movements = [2, 2, 2, 2, 2, 2, 2, 2, 2];
    aux = 0;
    return true;
  } else if (aux > 8) {
    // ? log("Tie")
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
