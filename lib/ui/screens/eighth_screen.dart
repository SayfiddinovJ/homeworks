import 'package:flutter/material.dart';
class EighthScreen extends StatefulWidget {
  const EighthScreen({super.key});

  @override
  State<EighthScreen> createState() => _EighthScreenState();
}

class _EighthScreenState extends State<EighthScreen> {
  bool isStarted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated TextStyle"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedDefaultTextStyle(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: isStarted ? 40 : 16,
                ),
                duration: const Duration(seconds: 1),
                child: const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  isStarted =! isStarted;
                });
              },
              child: Text(isStarted ? 'Small Font' : 'Bigger Font'),
            )
          ],
        ),
      ),
    );
  }
}
