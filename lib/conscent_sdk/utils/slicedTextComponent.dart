import 'package:flutter/material.dart';

class StationPointPainter extends CustomPainter {
  Color color = Colors.white;

  StationPointPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    // final p1 = Offset(0, 10);
    // final p2 = Offset(120,40);
    final p1 = Offset(size.width - 50, size.height - 15);
    final p2 = Offset(size.width + 0, size.height + 0);
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
