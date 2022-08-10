import 'package:triqui/provider/count.dart';
import 'package:triqui/provider/provider.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:flutter/services.dart';
import 'package:triqui/provider/validator.dart';
import 'package:triqui/view/marker.dart';

import 'game_controller/controllerDraw.dart';

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
            create: (context) => CountProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ValidatorProvider(),
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
    ValidatorProvider readValid = context.read<ValidatorProvider>();
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
                    children: const [
                      Marker(
                        text: "X",
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(width: 40),
                      Marker(
                        text: ":",
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(width: 40),
                      Marker(
                        text: "O",
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Marker(
                        text: context.watch<CountProvider>().xWin.toString(),
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(width: 90),
                      Marker(
                        text: context.watch<CountProvider>().oWin.toString(),
                        fontWeight: FontWeight.w400,
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
                      isXorO(
                        cubePinted: watch.isCubeOnePinted,
                        nCube: 0,
                        nameCube: 'OneTwoSevenEight',
                      ),
                      isXorO(
                        cubePinted: watch.isCubeTwoPinted,
                        nCube: 1,
                        nameCube: 'OneTwoSevenEight',
                      ),
                      isXorO(
                        cubePinted: watch.isCubeThreePinted,
                        nCube: 2,
                        nameCube: 'ThreeNine',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      isXorO(
                        cubePinted: watch.isCubeFourPinted,
                        nCube: 3,
                        nameCube: 'FourSix',
                      ),
                      isXorO(
                        cubePinted: watch.isCubeFivePinted,
                        nCube: 4,
                        nameCube: 'Five',
                      ),
                      isXorO(
                        cubePinted: watch.isCubeSixPinted,
                        nCube: 5,
                        nameCube: 'FourSix',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      isXorO(
                        cubePinted: watch.isCubeSevenPinted,
                        nCube: 6,
                        nameCube: 'OneTwoSevenEight',
                      ),
                      isXorO(
                        cubePinted: watch.isCubeEightPinted,
                        nCube: 7,
                        nameCube: 'OneTwoSevenEight',
                      ),
                      isXorO(
                        cubePinted: watch.isCubeNinePinted,
                        nCube: 8,
                        nameCube: 'ThreeNine',
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
          readValid.resetValidator(reset: true);
        },
        tooltip: 'Increment Counter',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
