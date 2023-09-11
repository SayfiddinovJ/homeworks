import 'package:flutter/material.dart';
import 'package:homeworks/data/rxdart/rxdart.dart';

class RxDartScreen extends StatelessWidget {
  const RxDartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MultiplicationController controller = MultiplicationController();
    controller.resultSubject.add(0);
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('RxDart')),
      body: StreamBuilder<int>(
        stream: controller.resultSubject,
        builder: (context, snapshot) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                TextField(
                  controller: controller1,
                  keyboardType: TextInputType.number,
                  onChanged: (v) {
                    if (controller1.text.isNotEmpty &&
                        controller2.text.isNotEmpty) {
                      controller.resultSubject.add(int.parse(controller1.text) *
                          int.parse(controller2.text));
                    }
                  },
                ),
                TextField(
                  controller: controller2,
                  keyboardType: TextInputType.number,
                  onChanged: (v) {
                    if (controller1.text.isNotEmpty &&
                        controller2.text.isNotEmpty) {
                      controller.resultSubject.add(int.parse(controller1.text) *
                          int.parse(controller2.text));
                    }
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
