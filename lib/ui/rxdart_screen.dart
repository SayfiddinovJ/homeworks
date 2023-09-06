import 'package:flutter/material.dart';
import 'package:homeworks/data/rxdart/rxdart.dart';

class RxDartScreen extends StatelessWidget {
  const RxDartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MultiplicationController controller = MultiplicationController();
    return Scaffold(
      appBar: AppBar(title: const Text('RxDart')),
      body: StreamBuilder<int>(
        stream: controller.multiplyNumbers(),
        builder: (context, snapshot) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (v) {
                    controller.number1Controller
                        .add(int.parse(v));
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (v) {
                    controller.number2Controller
                        .add(int.parse(v));
                  },
                ),
                const SizedBox(height: 10),
                Text('Result: ${snapshot.data}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
