import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedContainer(
              duration: const Duration(seconds: 2),
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: clicked ? Colors.green : Colors.deepOrange
              ),
              curve: Curves.linear,
              child: Center(child: Text(clicked ? "This is second screen" : "This is first screen",style: const TextStyle(fontWeight: FontWeight.w700),)),
            ),
          ),
          ElevatedButton(
              onPressed: (){
                clicked ? clicked = false : clicked = true;
                setState(() {});
              },
              child: const Text('Click here'))
        ],
      ),
    );
  }
}