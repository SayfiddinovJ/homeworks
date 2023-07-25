import 'package:flutter/material.dart';
class SeventhScreen extends StatefulWidget {
  const SeventhScreen({super.key});

  @override
  State<SeventhScreen> createState() => _SeventhScreenState();
}

class _SeventhScreenState extends State<SeventhScreen> {
  bool changed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alignment'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(5),
              height: 200,
              width: 200,
              color: Colors.grey,
              child: AnimatedAlign(
                curve: Curves.bounceInOut,
                alignment: changed ? Alignment.bottomRight : Alignment.topLeft,
                duration: const Duration(seconds: 2),
                child: const Text('Flutter'),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          TextButton(
            onPressed: (){
              setState(() {
                changed =! changed;
              });
            },
            child: const Text('Change Alignment'),
          ),
        ],
      ),
    );
  }
}
