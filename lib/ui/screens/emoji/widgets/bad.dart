import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Bad extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    //Draw the body bad
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Colors.orange
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
      ..color = Colors.orange
      ..strokeWidth = 5;
    canvas.drawArc(
      Rect.fromCenter(center: const Offset(50, 60), width: 20, height: 15),
      0,
      -pi,
      false,
      smilePaint,
    );
    //Draw the eyes
    var pointsEyes = [
      Offset(size.width / 2 + 7, size.height / 2 - 10),
      Offset(size.width / 2 + 15, size.height / 2 - 8),
      Offset(size.width / 2 - 7, size.height / 2 - 10),
      Offset(size.width / 2 - 15, size.height / 2 - 8),
    ];
    final paintEyes = Paint()
      ..color = Colors.orange
      ..strokeWidth = 5
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.lines, pointsEyes, paintEyes);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}