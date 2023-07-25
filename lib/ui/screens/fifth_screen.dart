import 'package:flutter/material.dart';
class FifthScreen extends StatefulWidget {
  const FifthScreen({super.key});

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  bool isStarted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated TextStyle"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedDefaultTextStyle(
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              color: isStarted ? Colors.red : Colors.blue,
              fontWeight: isStarted ? FontWeight.w700 : FontWeight.w200,
              fontSize: isStarted ? 50 : 20,
            ),
            duration: const Duration(seconds: 1),
            child: const Text('Hello Flutter World'),
          ),
          const SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: (){
                  setState(() {
                    isStarted=true;
                  });
                },
                icon: const Icon(Icons.not_started),
              ),
              const SizedBox(width: 40,),
              IconButton(
                onPressed: (){
                  setState(() {
                    isStarted=false;
                  });
                },
                icon: const Icon(Icons.refresh),
              ),
            ],
          )
        ],
      ),
    );
  }
}
