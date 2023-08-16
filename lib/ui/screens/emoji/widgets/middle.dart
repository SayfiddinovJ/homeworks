import 'dart:math';

import 'package:flutter/material.dart';

class Middle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width, size.height) / 2-30;
    final center = Offset(size.width / 2, size.height / 2);

    //Draw the body middle
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Colors.yellow
      ..strokeWidth = 5;
    canvas.drawArc(
        Rect.fromCenter(
            center: center, width: size.width/2, height: size.height / 2 ),
        0,
        2 * pi,
        false,
        paint);
    //Draw the mouth
    final smilePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Colors.yellow
      ..strokeWidth = 5;
    canvas.drawArc(
      Rect.fromCenter(center: const Offset(50, 60), width: 20, height: 10),
      0,
      -pi,
      false,
      smilePaint,
    );
    //Draw the eyes
    canvas.drawCircle(
        Offset(center.dx - radius / 2, center.dy - radius / 2), 5, Paint()..color = Colors.yellow);
    canvas.drawCircle(
        Offset(center.dx + radius / 2, center.dy - radius / 2), 5, Paint()..color = Colors.yellow);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}