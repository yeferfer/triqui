// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

import '../main.dart';
import '../painted/board.dart';
import '../painted/o.dart';
import '../painted/x.dart';
import 'controllerCube.dart';

// ignore: camel_case_types
class isXorO extends StatelessWidget {
  final dynamic cubePinted;
  final int nCube;
  final String nameCube;
  const isXorO({
    Key? key,
    required this.cubePinted,
    required this.nCube,
    required this.nameCube,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        cubePinted
            ? movements.elementAt(nCube) == 0
            ? XContainer(painter: XPainter())
            : OContainer(painter: OPainter())
            : const CustomPaint(),
        Cube(painter: BoardPainter(cube: nameCube), cube: nCube + 1),
      ],
    );
  }
}
