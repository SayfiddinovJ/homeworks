import 'package:flutter/material.dart';
import 'package:homeworks/providers/calculator_provider.dart';
import 'package:homeworks/providers/number_provider.dart';
import 'package:homeworks/ui/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(
        create: (context) => NumberProvider(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (context) => CalculatorProvider(result: 0),
        lazy: true,
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}