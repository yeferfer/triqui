import 'package:flutter/material.dart';

class BoardPainter extends CustomPainter {
  final String cube;
  BoardPainter({required this.cube});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path();

    switch (cube) {
      case "OneTwoSevenEight":
        path.moveTo(size.height, 0);
        path.lineTo(size.width, size.height);
        break;
      case "FourSix":
        path.lineTo(size.width, 0);
        path.moveTo(0, size.width);
        path.lineTo(size.width, size.height);
        break;
      case "Five":
        path.lineTo(0, size.height);
        path.moveTo(0, 0);
        path.lineTo(size.width, 0);
        path.moveTo(size.width, 0);
        path.lineTo(size.width, size.height);
        path.moveTo(0, size.width);
        path.lineTo(size.width, size.height);
        break;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BoardPainter oldDelegate) => true;
}