import 'package:flutter/material.dart';

class FlagScreen extends StatelessWidget {
  const FlagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flag'),
      ),
      body: Center(
        child: CustomPaint(
          size: const Size(300, 320),
          painter: FlagPainter(),
        ),
      ),
    );
  }
}

class FlagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()..color = Colors.blue;
    var paint2 = Paint()..color = Colors.red;
    var paint3 = Paint()..color = Colors.white;
    var paint4 = Paint()..color = Colors.green;
    canvas.drawRect(
      const Offset(0, 0) & Size(size.width, 90),
      paint1,
    );
    canvas.drawRect(
      Rect.fromCenter(
          center: const Offset(150, 95), width: size.width, height: 10),
      paint2,
    );
    canvas.drawRect(
      Rect.fromCenter(
          center: const Offset(150, 145), width: size.width, height: 90),
      paint3,
    );
    canvas.drawRect(
      Rect.fromCenter(
          center: const Offset(150, 195), width: size.width, height: 10),
      paint2,
    );
    canvas.drawRect(
      Rect.fromCenter(
          center: const Offset(150, 245), width: size.width, height: 90),
      paint4,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
