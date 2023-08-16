import 'package:flutter/material.dart';
import 'package:homeworks/ui/screens/emoji/widgets/bad.dart';
import 'package:homeworks/ui/screens/emoji/widgets/good.dart';
import 'package:homeworks/ui/screens/emoji/widgets/middle.dart';
import 'package:homeworks/ui/screens/emoji/widgets/very_bad.dart';
import 'package:homeworks/ui/screens/emoji/widgets/very_good.dart';

class EmojisScreen extends StatefulWidget {
  const EmojisScreen({Key? key}) : super(key: key);

  @override
  State<EmojisScreen> createState() => _EmojisScreenState();
}

class _EmojisScreenState extends State<EmojisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emojis'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: CustomPaint(
                      size: const Size(100, 100),
                      painter: VeryGood(),
                    ),
                  ),
                  const Text('Very good'),
                ],
              ),
              Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: CustomPaint(
                      size: const Size(100, 100),
                      painter: Good(),
                    ),
                  ),
                  const Text('Good'),
                ],
              ),
              Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: CustomPaint(
                      size: const Size(100, 100),
                      painter: Middle(),
                    ),
                  ),
                  const Text('Middle'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: CustomPaint(
                      size: const Size(100, 100),
                      painter: Bad(),
                    ),
                  ),
                  const Text('Bad'),
                ],
              ),
              Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: CustomPaint(
                      size: const Size(100, 100),
                      painter: VeryBad(),
                    ),
                  ),
                  const Text('Very bad'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
