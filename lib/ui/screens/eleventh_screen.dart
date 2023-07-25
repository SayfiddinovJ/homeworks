import 'package:flutter/material.dart';
class EleventhScreen extends StatefulWidget {
  const EleventhScreen({super.key});

  @override
  State<EleventhScreen> createState() => _EleventhScreenState();
}

class _EleventhScreenState extends State<EleventhScreen> {

  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: [
          Center(
            child: AnimatedContainer(
              duration: const Duration(seconds: 3),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
              ),
              child: Container(
                height: isChanged ? 200 : 100,
                width: isChanged ? 200 : 100,
                color: Colors.green,
                child: const Center(child: Text('Wool ha')),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: (){
              setState(() {
                isChanged =! isChanged;
              });
            },
            child: const Text('Change size'),
          ),
        ],
      ),
    );
  }
}