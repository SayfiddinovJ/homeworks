import 'package:flutter/material.dart';

class TenthScreen extends StatefulWidget {
  const TenthScreen({super.key});

  @override
  State<TenthScreen> createState() => _TenthScreenState();
}

class _TenthScreenState extends State<TenthScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: AnimatedContainer(
          height: 200,
          width: 200,
          duration: const Duration(seconds: 3),
          decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(
              color:  Colors.orange,
              width: 5,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 5,
                blurRadius: 10
              ),
            ],
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
