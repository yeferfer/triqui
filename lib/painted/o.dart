import 'package:flutter/material.dart';

class OContainer extends StatelessWidget {
  final CustomPainter? painter;
  const OContainer({Key? key, this.painter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
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

class OPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.blue, Colors.indigo],
      ).createShader(rect)
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(const Offset(40, 40), 35, paint);
  }

  @override
  bool shouldRepaint(OPainter oldDelegate) => true;
}
