import 'package:flutter/material.dart';

class XContainer extends StatelessWidget {
  final CustomPainter? painter;
  const XContainer({Key? key, this.painter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: SizedBox(
        width: 50,
        height: 50,
        child: CustomPaint(
          painter: painter,
        ),
      ),
    );
  }
}

class XPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.orange, Colors.red],
      ).createShader(rect)
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..lineTo(size.width, size.height)
      ..moveTo(size.width, 0)
      ..lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(XPainter oldDelegate) => true;
}
