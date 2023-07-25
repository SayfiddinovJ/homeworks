import 'package:flutter/material.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  double padding = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Padding"),
      ),
      body: Center(
        child: AnimatedPadding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          duration: const Duration(seconds: 2),
          child: GestureDetector(
            onTap: (){
              setState(() {
                padding==20?padding=100:padding=20;
              });
            },
            child: Container(
              height: 100,
              width: double.infinity,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
