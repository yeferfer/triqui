import 'package:triqui/painted/board.dart';
import 'package:triqui/painted/o.dart';
import 'package:triqui/painted/x.dart';
import 'package:triqui/provider/count.dart';
import 'package:triqui/provider/provider.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:flutter/services.dart';

import 'game_controller/controllerCube.dart';

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
          ChangeNotifierProvider<CountProvider>(
              create: (context) => CountProvider()),
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
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 45),
              child: Column(
                children: [
                  const Text(
                    "TRIQUI",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: const Text("X",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w500)),
                      ),
                      const SizedBox(width: 40),
                      Container(
                        alignment: Alignment.center,
                        child: const Text(":",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w400)),
                      ),
                      const SizedBox(width: 40),
                      Container(
                        alignment: Alignment.center,
                        child: const Text("O",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          context.watch<CountProvider>().xWin.toString(),
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(width: 90),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                            context.watch<CountProvider>().oWin.toString(),
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ],
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
              padding: const EdgeInsets.only(top: 70),
              child: Text(
                "Turno del jugador ${watch.isPlayerOne ? "O" : "X"}"
                    .toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          aux = 0;
          movements = [2, 2, 2, 2, 2, 2, 2, 2, 2];
          context.read<CountProvider>().setOWin(win: 0);
          context.read<CountProvider>().setXWin(win: 0);
          read.resetGame(resetGame: true);
        },
        tooltip: 'Increment Counter',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}