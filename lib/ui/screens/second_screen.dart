import 'dart:math';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation = Tween<double>(begin: 0, end: 2*pi).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
      reverseCurve: Curves.easeOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
      });
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transform rotate"),
      ),
      body: Center(
        child: Transform.rotate(
          angle: animation.value,
          child: Container(
            height: 200,
            width: 200,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}