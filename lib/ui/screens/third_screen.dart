
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen>{
  double top = 100;
  double left = 100;
  double right = 100;
  double bottom = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Positioned'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              const SizedBox(
                height: 250,
                width: 250,
              ),
              AnimatedPositioned(
                top: top,
                left: left,
                right: right,
                bottom: bottom,
                duration: const Duration(seconds: 1),
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: (){
              setState(() {
                bottom = 200;
                top = 0;
                left = 100;
                right = 100;
              });
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      bottom = 100;
                      top = 100;
                      left = 0;
                      right = 200;
                    });
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      right = 0;
                      bottom = 100;
                      top = 100;
                      left = 200;
                    });
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
            ],),
          ),
          ElevatedButton(
            onPressed: (){
              setState(() {
                bottom = 0;
                top = 200;
                left = 100;
                right = 100;
              });
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
        ],
      ),
    );
  }
}
