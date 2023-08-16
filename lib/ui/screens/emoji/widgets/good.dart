import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Good extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width, size.height) / 2 - 30;
    final center = Offset(size.width / 2, size.height / 2);

    //Draw the body good
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Colors.blue
      ..strokeWidth = 5;
    canvas.drawArc(
        Rect.fromCenter(
            center: center, width: size.width / 2, height: size.height / 2),
        0,
        2 * pi,
        false,
        paint);

    //Draw the mouth
    var pointsMouse = [
      Offset(size.width / 2 + 10, size.height / 2 + 8),
      Offset(size.width / 2 - 10, size.height / 2 + 8),
    ];
    final paintRightHand = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.lines, pointsMouse, paintRightHand);

    //Draw the eyes
    canvas.drawCircle(Offset(center.dx - radius / 2, center.dy - radius / 2), 5,
        Paint()..color = Colors.blue);
    canvas.drawCircle(Offset(center.dx + radius / 2, center.dy - radius / 2), 5,
        Paint()..color = Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
