import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../game_controller/controllerDraw.dart';
import '../generated/l10n.dart';
import '../provider/animation.dart';
import '../provider/count.dart';
import '../provider/provider.dart';
import '../provider/validator.dart';
import '../view/marker.dart';


List<int> movements = [2, 2, 2, 2, 2, 2, 2, 2, 2];
int aux = 0;

class TriquiPage extends StatefulWidget {
  const TriquiPage({Key? key}) : super(key: key);

  @override
  State<TriquiPage> createState() => _TriquiPageState();
}

class _TriquiPageState extends State<TriquiPage> with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TriquiProvider watch = context.watch<TriquiProvider>();
    TriquiProvider read = context.read<TriquiProvider>();
    ValidatorProvider readValid = context.read<ValidatorProvider>();
    AnimationProvider watchAnimation = context.watch<AnimationProvider>();
    AnimationProvider readAnimation = context.read<AnimationProvider>();
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 40),
              child: Column(
                children: [
                   Text(
                    S.of(context).simpleText.toUpperCase(),
                    style: const TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Marker(
                        text: "X",
                        fontWeight: FontWeight.w500,
                        color: [Colors.orange, Colors.red],
                      ),
                      SizedBox(width: 40),
                      Marker(
                        text: ":",
                        fontWeight: FontWeight.w400,
                        color: [Colors.black, Colors.black],
                      ),
                      SizedBox(width: 40),
                      Marker(
                        text: "O",
                        fontWeight: FontWeight.w500,
                        color: [Colors.blue, Colors.indigo],
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
                        color: const [Colors.black, Colors.black],
                      ),
                      const SizedBox(width: 90),
                      Marker(
                        text: context.watch<CountProvider>().oWin.toString(),
                        fontWeight: FontWeight.w400,
                        color: const [Colors.black, Colors.black],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TweenAnimationBuilder(
              tween: Tween(
                begin: Offset(
                    watchAnimation.horizontal * _animationController!.value, 0),
                end: Offset(watchAnimation.horizontal, 0),
              ),
              duration: const Duration(microseconds: 50000),
              builder: (BuildContext context, _, Widget? child) {
                return Transform.translate(
                    offset: Offset(
                        watchAnimation.horizontal * _animationController!.value,
                        0),
                    child: child);
              },
              onEnd: () => readAnimation.setSize(horizontal: 0),
              child: SizedBox(
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Text(
                    S.of(context).playerIsTurn.toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    watch.isPlayerOne ? "O" : "X".toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      foreground: Paint()
                        ..shader = LinearGradient(
                          colors: watch.isPlayerOne
                              ? [Colors.blue, Colors.indigo]
                              : [Colors.orange, Colors.red],
                        ).createShader(
                          const Rect.fromLTWH(0, 150, 300, 200),
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
        tooltip: S.of(context).restartGame,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
