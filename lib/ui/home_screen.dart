import 'package:flutter/material.dart';
import 'package:homeworks/data/rxdart/rxdart.dart';
import 'package:homeworks/ui/counter_screen.dart';
import 'package:homeworks/ui/dictionary_screen.dart';
import 'package:homeworks/ui/rxdart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MultiplicationController controller = MultiplicationController();
    return Scaffold(
      appBar: AppBar(title: const Text("Homeworks")),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Counter'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CounterScreen()));
            },
          ),
          ListTile(
            title: const Text('GetX Dictionary'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DictionaryScreen()));
            },
          ),
          ListTile(
            title: const Text('RxDart'),
            onTap: () {
              controller.number1Controller.add(0);
              controller.number2Controller.add(0);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RxDartScreen()));
            },
          ),
        ],
      ),
    );
  }
}
