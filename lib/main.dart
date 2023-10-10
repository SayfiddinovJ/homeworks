import 'package:flutter/material.dart';
import 'package:homeworks/ui/home_screen.dart';
import 'package:homeworks/data/fake_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(contacts: fakeData),
    );
  }
}
