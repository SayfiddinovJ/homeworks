import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class SnowmanScreen extends StatelessWidget {
  const SnowmanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snowman'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height - 80),
              painter: SnowmanPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class SnowmanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius1 = min(size.width, size.height) / 2;
    final radius2 = min(size.width - 80, size.height) / 2;
    final radius3 = min(size.width - 140, size.height) / 2;

    final center1 = Offset(size.width / 2, size.height / 2 + 150);
    final center2 = Offset(size.width / 2, size.height / 2 + 20);
    final center3 = Offset(size.width / 2, size.height / 2 - 90);

    final centerButton1 = Offset(size.width / 2, size.height / 2 - 10);
    final centerButton2 = Offset(size.width / 2, size.height / 2 + 13);
    final centerButton3 = Offset(size.width / 2, size.height / 2 + 35);

    final centerMouse3 = Offset(size.width / 2 + 20, size.height / 2 - 70);
    final centerMouse4 = Offset(size.width / 2 - 7, size.height / 2 - 65);
    final centerMouse1 = Offset(size.width / 2 + 7, size.height / 2 - 65);
    final centerMouse2 = Offset(size.width / 2 - 20, size.height / 2 - 70);

    final centerEye2 = Offset(size.width / 2 - 20, size.height / 2 - 115);
    final centerEye1 = Offset(size.width / 2 + 20, size.height / 2 - 115);

    final smilePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    final buttonPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    // Right hand
    var pointsRightHand = [
      Offset(size.width / 2 - 50, size.height / 2 + 20),
      Offset(size.width / 2 - 120, size.height / 2),
      Offset(size.width / 2 - 50, size.height / 2 + 10),
      Offset(size.width / 2 - 120, size.height / 2 - 10),
      Offset(size.width / 2 - 50, size.height / 2 + 20),
      Offset(size.width / 2 - 50, size.height / 2 + 10),
      Offset(size.width / 2 - 120, size.height / 2 - 10),
      Offset(size.width / 2 - 130, size.height / 2 - 30),
      Offset(size.width / 2 - 130, size.height / 2 - 13),
      Offset(size.width / 2 - 140, size.height / 2 - 30),
      Offset(size.width / 2 - 130, size.height / 2 - 30),
      Offset(size.width / 2 - 140, size.height / 2 - 30),
      Offset(size.width / 2 - 130, size.height / 2 - 13),
      Offset(size.width / 2 - 150, size.height / 2 - 20),
      Offset(size.width / 2 - 150, size.height / 2 - 20),
      Offset(size.width / 2 - 150, size.height / 2 - 10),
      Offset(size.width / 2 - 150, size.height / 2 - 10),
      Offset(size.width / 2 - 130, size.height / 2 - 3),
      Offset(size.width / 2 - 140, size.height / 2 + 15),
      Offset(size.width / 2 - 130, size.height / 2 - 3),
      Offset(size.width / 2 - 130, size.height / 2 + 18),
      Offset(size.width / 2 - 140, size.height / 2 + 15),
      Offset(size.width / 2 - 130, size.height / 2 + 18),
      Offset(size.width / 2 - 120, size.height / 2 ),
    ];
    final paintRightHand = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.lines, pointsRightHand, paintRightHand);

    // Left hand
    var pointsLeftHand = [
      Offset(size.width / 2 + 50, size.height / 2 + 20),
      Offset(size.width / 2 + 120, size.height / 2),
      Offset(size.width / 2 + 50, size.height / 2 + 10),
      Offset(size.width / 2 + 120, size.height / 2 - 10),
      Offset(size.width / 2 + 50, size.height / 2 + 20),
      Offset(size.width / 2 + 50, size.height / 2 + 10),
      Offset(size.width / 2 + 120, size.height / 2 - 10),
      Offset(size.width / 2 + 130, size.height / 2 - 30),
      Offset(size.width / 2 + 130, size.height / 2 - 13),
      Offset(size.width / 2 + 140, size.height / 2 - 30),
      Offset(size.width / 2 + 130, size.height / 2 - 30),
      Offset(size.width / 2 + 140, size.height / 2 - 30),
      Offset(size.width / 2 + 130, size.height / 2 - 13),
      Offset(size.width / 2 + 150, size.height / 2 - 20),
      Offset(size.width / 2 + 150, size.height / 2 - 20),
      Offset(size.width / 2 + 150, size.height / 2 - 10),
      Offset(size.width / 2 + 150, size.height / 2 - 10),
      Offset(size.width / 2 + 130, size.height / 2 - 3),
      Offset(size.width / 2 + 140, size.height / 2 + 15),
      Offset(size.width / 2 + 130, size.height / 2 - 3),
      Offset(size.width / 2 + 130, size.height / 2 + 18),
      Offset(size.width / 2 + 140, size.height / 2 + 15),
      Offset(size.width / 2 + 130, size.height / 2 + 18),
      Offset(size.width / 2 + 120, size.height / 2 ),
    ];
    final paintLeftHand = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.lines, pointsLeftHand, paintLeftHand);

    // Nose
    var pointsNose = [
      Offset(size.width / 2 + 80, size.height / 2 - 90),
      Offset(size.width / 2, size.height / 2 - 80),
      Offset(size.width / 2 - 5, size.height / 2 - 95),
      Offset(size.width / 2 + 80, size.height / 2 - 90),
      Offset(size.width / 2, size.height / 2 - 80),
      Offset(size.width / 2 - 5, size.height / 2 - 95),
    ];
    final paintNose = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.lines, pointsNose, paintNose);

    // Eyes
    canvas.drawArc(
      Rect.fromCenter(center: centerEye2, width: 15, height: 15),
      0,
      2 * pi,
      false,
      buttonPaint,
    );
    canvas.drawArc(
      Rect.fromCenter(center: centerEye1, width: 15, height: 15),
      0,
      2 * pi,
      false,
      buttonPaint,
    );

    // Circle first
    canvas.drawArc(
      Rect.fromCenter(center: center1, width: radius1, height: radius1),
      0,
      2 * pi,
      false,
      smilePaint,
    );
    // Circle second
    canvas.drawArc(
      Rect.fromCenter(center: center2, width: radius2, height: radius2),
      0,
      2 * pi,
      false,
      smilePaint,
    );

    // Circle third
    canvas.drawArc(
      Rect.fromCenter(center: center3, width: radius3, height: radius3),
      0,
      2 * pi,
      false,
      smilePaint,
    );

    // Mouse
    canvas.drawArc(
      Rect.fromCenter(center: centerMouse4, width: 10, height: 10),
      0,
      2 * pi,
      false,
      buttonPaint,
    );
    canvas.drawArc(
      Rect.fromCenter(center: centerMouse3, width: 10, height: 10),
      0,
      2 * pi,
      false,
      buttonPaint,
    );
    canvas.drawArc(
      Rect.fromCenter(center: centerMouse2, width: 10, height: 10),
      0,
      2 * pi,
      false,
      buttonPaint,
    );
    canvas.drawArc(
      Rect.fromCenter(center: centerMouse1, width: 10, height: 10),
      0,
      2 * pi,
      false,
      buttonPaint,
    );

    // Buttons
    canvas.drawArc(
      Rect.fromCenter(center: centerButton3, width: 10, height: 10),
      0,
      2 * pi,
      false,
      buttonPaint,
    );
    canvas.drawArc(
      Rect.fromCenter(center: centerButton2, width: 10, height: 10),
      0,
      2 * pi,
      false,
      buttonPaint,
    );
    canvas.drawArc(
      Rect.fromCenter(center: centerButton1, width: 10, height: 10),
      0,
      2 * pi,
      false,
      buttonPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
